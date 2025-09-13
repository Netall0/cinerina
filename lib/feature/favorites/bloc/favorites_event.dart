part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

final class LoadFavorites extends FavoritesEvent {}

final class AddFavorite extends FavoritesEvent {
  final FavoritesModel? model;

  AddFavorite({required this.model});
}

final class DeleteFavorite extends FavoritesEvent {
  final FavoritesModel? model;

  DeleteFavorite({required this.model});
}

final class ToggleFavorite extends FavoritesEvent {
  final FavoritesModel? model;

  ToggleFavorite({required this.model});
}

final class ResetFavorites extends FavoritesEvent {}
