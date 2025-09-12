part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesState {
  const FavoritesState({this.favoritesList});

  final List<FavoritesModel>? favoritesList;

}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({required this.favoritesList});

  @override
  final List<FavoritesModel> favoritesList;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesLoaded &&
          runtimeType == other.runtimeType &&
          favoritesList == other.favoritesList;

  @override
  int get hashCode => Object.hashAll([favoritesList]);
}

final class FavoritesError extends FavoritesState {
  const FavoritesError(this.error);

  final Object error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => Object.hashAll([error]);
}
