part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  const SearchState({this.searchList,this.favoritesList});

  final SearchModel? searchList;

  final List<FavoritesModel>? favoritesList;
}

final class SearchInitial extends SearchState {
  const SearchInitial({super.searchList,super.favoritesList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInitial && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);
}

final class SearchLoading extends SearchState {
  const SearchLoading({super.searchList,super.favoritesList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInitial && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);
}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.searchList, required this.favoritesList,});

  @override
  final SearchModel searchList;

  @override
  final List<FavoritesModel> favoritesList;



  operator ==(Object other) =>
      identical(this, other) ||
      other is SearchLoaded &&
          runtimeType == other.runtimeType &&
          searchList == other.searchList &&
          favoritesList == other.favoritesList;

  @override
  int get hashCode => Object.hashAll([searchList,favoritesList]);



  copyWith({
    SearchModel? searchList,
    List<FavoritesModel>? favoritesList,
  }) {
    return SearchLoaded(
      searchList: searchList ?? this.searchList,
      favoritesList: favoritesList ?? this.favoritesList,
    );
  }

}

final class SearchEmpty extends SearchState {
  const SearchEmpty({super.searchList, this.query,super.favoritesList});
  final String? query;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchEmpty && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);

}

final class SearchError extends SearchState {
  const SearchError(this.error, {super.searchList});

  final Object error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchError && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);
}
