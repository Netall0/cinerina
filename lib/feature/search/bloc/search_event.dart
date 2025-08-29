part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {
  const SearchEvent({this.query});

  final String? query;
}

final class SearchMovie extends SearchEvent {
  const SearchMovie({required this.query});

  @override
  final String query;

  @override
  int get hashCode => Object.hashAll([query]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchMovie &&
          runtimeType == other.runtimeType &&
          query == other.query;
}
