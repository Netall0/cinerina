import 'dart:async';

import 'package:cinerina/core/bloc/bloc_transformer.dart';
import 'package:cinerina/core/database/drift.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/favorites/data/i_favorites_repository.dart';
import 'package:cinerina/feature/favorites/model/favorites_model.dart';
import 'package:cinerina/feature/history/data/i_search_history_repository.dart';
import 'package:cinerina/feature/search/data/i_search_repository.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> with LoggerMixin {
  final ISearchRepository _searchRepository;
  final ISearchHistoryRepository _searchHistoryRepository;
  final IFavoritesRepository _favoritesRepository;
  final AppDatabase _appDatabase;

  SearchBloc({
    required AppDatabase appDatabase,
    required ISearchRepository searchRepository,
    required ISearchHistoryRepository searchHistoryRepository,
    required IFavoritesRepository favoritesRepository,
  }) : _searchRepository = searchRepository,
  _appDatabase = appDatabase,
       _searchHistoryRepository = searchHistoryRepository,
       _favoritesRepository = favoritesRepository,
       super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) => switch (event) {
        SearchMovie() => _searchMovies(event, emit),
      },
      transformer: BlocTransformer.sequential(),
    );
  }

  @override
  Future<bool> isInFavorites(int id) async {
    try {
      final query = _appDatabase.select(_appDatabase.searchDriftModel)
        ..where((tbl) => tbl.id.equals(id));

      final result = await query.getSingleOrNull();
      return result != null;
    } catch (e) {
      print('Error checking if item is in favorites: $e');
      return false; // При ошибке считаем, что элемента нет
    }
  }

  @override
  Future<int> addFavorites(FavoritesModel model) async {
    try {
      // Проверяем, существует ли уже такой элемент
      final exists = await isInFavorites(model.id);
      if (exists) {
        throw Exception('Item with id ${model.id} already exists in favorites');
      }

      return await _appDatabase
          .into(_appDatabase.searchDriftModel)
          .insert(model.toDriftCompanion());
    } catch (e) {
      // Логируем ошибку и перебрасываем
      print('Error adding to favorites: $e');
      rethrow;
    }
  }

  Future<void> _searchMovies(
    SearchMovie event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(SearchLoading());
      (event.query.length <= 2) ? emit(SearchEmpty(query: event.query)) : null;

      final result = await _searchRepository.searchMovies(event.query);
      final docs = result.docs;

      await _searchHistoryRepository.addSearchHistory(event.query);

      final favoritesModel = await _favoritesRepository.getFavorites();

      emit(
        docs?.isNotEmpty ?? true
            ? SearchLoaded(searchList: result, favoritesList: favoritesModel)
            : SearchEmpty(query: event.query),
      );
    } on Object catch (e) {
      emit(SearchError(e.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
