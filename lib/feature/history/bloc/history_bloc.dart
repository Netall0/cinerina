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
    on<LoadHistory>(_loadHistory);
    on<AddHistory>(_addHistory);
    on<DeleteHistory>(_deleteHistory);
    on<ResetHistory>(_resetHistory);
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
    } catch (e) {
      logError(e.toString());
    }
  }

  Future<void> _addHistory(AddHistory event, Emitter<HistoryState> emit) async {
    if (event.query.trim().isEmpty) return;

    try {
      await _searchHistoryRepository.addSearchHistory(event.query.trim());
      final result = await _searchHistoryRepository.getSearchHistory();
      emit(
        result.isNotEmpty ? HistoryLoaded(historyList: result) : HistoryEmpty(),
      );
    } catch (e) {
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
