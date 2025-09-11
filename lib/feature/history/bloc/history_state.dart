part of 'history_bloc.dart';

sealed class HistoryState {
  const HistoryState();
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HistoryInitial;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HistoryLoading;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class HistoryLoaded extends HistoryState {
  const HistoryLoaded({required this.historyList});

  final List<String> historyList;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryLoaded && historyList == other.historyList;

  @override
  int get hashCode => Object.hashAll([historyList]);
}

final class HistoryEmpty extends HistoryState {
  const HistoryEmpty();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HistoryEmpty;

  @override
  int get hashCode => runtimeType.hashCode;
}

final class HistoryError extends HistoryState {
  const HistoryError(this.error);

  final Object error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryError && error == other.error;

  @override
  int get hashCode => Object.hashAll([error]);
}
