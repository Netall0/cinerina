import 'dart:async';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/history/data/i_search_history_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> with LoggerMixin {
  final ISearchHistoryRepository _searchHistoryRepository;

  HistoryBloc({required ISearchHistoryRepository searchHistoryRepository})
    : _searchHistoryRepository = searchHistoryRepository,
      super(HistoryInitial()) {
        on<HistoryEvent>(
          (event, emit) => switch (event) {
            LoadHistory() => _loadHistory(event, emit),
            DeleteHistory() => _deleteHistory(event, emit),
            ResetHistory() => _resetHistory(event, emit),
          },
        );
  }

  Future<void> _deleteHistory(
    DeleteHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _searchHistoryRepository.removeFromHistory(event.query);
      final result = await _searchHistoryRepository.getSearchHistory();
      emit(
        result.isNotEmpty ? HistoryLoaded(historyList: result) : HistoryEmpty(),
      );
    } catch (e) {
      logError(e.toString());
    }
  }

  Future<void> _resetHistory(
    ResetHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _searchHistoryRepository.resetSearchHistory();
      emit(HistoryEmpty());
    }on Object catch(e) {
      logError(e.toString());
    }
  }



  Future<void> _loadHistory(
    LoadHistory event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      final result = await _searchHistoryRepository.getSearchHistory();
      emit(
        result.isNotEmpty ? HistoryLoaded(historyList: result) : HistoryEmpty(),
      );
    } catch (e) {
      logError(e.toString());
    }
  }
}
