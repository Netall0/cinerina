import 'package:cinerina/feature/favorites/model/favorites_model.dart';

abstract interface class FavoritesRepository {
  Future<List<FavoritesModel>> getFavorites();
  Future<void> addFavorites(FavoritesModel model);
  Future<void> removeFromFavorites(int id);
  Future<void> resetFavorites();
  Future<bool> isInFavorites(int id);
}
