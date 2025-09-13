part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {
  const SearchEvent({this.query, this.completer,this.favoritesModel});

  final String? query;

  final Completer? completer;

  final FavoritesModel? favoritesModel;
}

final class SearchMovie extends SearchEvent {
  const SearchMovie({required this.query, this.completer});

  @override
  final String query;

  @override
  final Completer? completer;

  @override
  int get hashCode => Object.hashAll([query]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchMovie &&
          runtimeType == other.runtimeType &&
          query == other.query;
}

