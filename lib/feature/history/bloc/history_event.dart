part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {
  const HistoryEvent({this.query});

  final String? query;
}

final class LoadHistory extends HistoryEvent {
  const LoadHistory({required this.query});

  @override
  final String query;

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadHistory &&
          runtimeType == other.runtimeType &&
          query == other.query;
}

final class AddHistory extends HistoryEvent {
  const AddHistory({required this.query});

  @override
  final String query;

  @override
  int get hashCode => Object.hashAll([query]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddHistory &&
          runtimeType == other.runtimeType &&
          query == other.query;
}

final class ResetHistory extends HistoryEvent {
  const ResetHistory();

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ResetHistory && runtimeType == other.runtimeType;
}

final class DeleteHistory extends HistoryEvent {
  const DeleteHistory({required this.query});

  @override
  final String query;

  @override
  int get hashCode => Object.hashAll([query]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteHistory &&
          runtimeType == other.runtimeType &&
          query == other.query;
}


