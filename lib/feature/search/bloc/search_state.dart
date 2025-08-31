part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  const SearchState({this.searchList});

  final SearchModel? searchList;
}

final class SearchInitial extends SearchState {
  const SearchInitial({super.searchList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInitial && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);
}

final class SearchLoading extends SearchState {
  const SearchLoading({super.searchList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInitial && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);
}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required this.searchList});

  @override 
  final SearchModel searchList;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchLoaded && searchList == other.searchList;

  @override
  int get hashCode => Object.hashAll([searchList]);

}


final class SearchEmpty extends SearchState {
  const SearchEmpty({super.searchList, this.query});

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
