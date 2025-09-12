import 'dart:async';

import 'package:cinerina/core/bloc/bloc_transformer.dart';
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

  SearchBloc({
    required ISearchRepository searchRepository,
    required ISearchHistoryRepository searchHistoryRepository,
    required IFavoritesRepository favoritesRepository,
  }) : _searchRepository = searchRepository,
       _searchHistoryRepository = searchHistoryRepository,
       _favoritesRepository = favoritesRepository,
       super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) => switch (event) {
        SearchMovie() => _searchMovies(event, emit),
        ToggleFavorite() => _toggleFavorite(event, emit),
      },
      transformer: BlocTransformer.sequential(),
    );
  }

  Future<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final prevState = state;

      if (prevState is! SearchLoaded) {
        logDebug('not SearchLoaded');
        return;
      }

      await _favoritesRepository.addFavorites(event.favoritesModel!);
      final favoritesList = await _favoritesRepository.getFavorites();
      logDebug('Favorites updated: ${favoritesList.length} items');

      return prevState.copyWith(favoritesList: favoritesList);
    }on Object catch (e) {
      emit(SearchError(e.toString()));
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
