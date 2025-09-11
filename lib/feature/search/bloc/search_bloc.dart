import 'dart:async';

import 'package:cinerina/core/bloc/bloc_transformer.dart';
import 'package:cinerina/feature/history/data/i_search_history_repository.dart';
import 'package:cinerina/feature/search/data/i_search_repository.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchRepository _searchRepository;
  final ISearchHistoryRepository _searchHistoryRepository;

  SearchBloc({
    required ISearchRepository searchRepository,
    required ISearchHistoryRepository searchHistoryRepository,
  }) : _searchRepository = searchRepository,
       _searchHistoryRepository = searchHistoryRepository,
       super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) => switch (event) {
        SearchMovie() => _searchMovies(event, emit),
      },
      transformer: BlocTransformer.sequential(),
    );
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

      emit(
        docs?.isNotEmpty ?? true
            ? SearchLoaded(searchList: result)
            : SearchEmpty(query: event.query),
      );
    } on Object catch (e) {
      emit(SearchError(e.toString()));
    } finally {
      event.completer?.complete();
    }
  }
}
