part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {
  const FavoritesEvent({this.id});
  final int? id;
}

final class LoadFavorites extends FavoritesEvent {}

// final class DeleteFavorite extends FavoritesEvent {
//   const DeleteFavorite({required this.id});
//   @override
//   final int id;

//   @override
//   int get hashCode => Object.hashAll([id]);

//   @override
//   operator ==(Object other) =>
//       identical(this, other) ||
//       other is DeleteFavorite &&
//           runtimeType == other.runtimeType &&
//           id == other.id;
// }

// final class ResetFavorites extends FavoritesEvent {}
