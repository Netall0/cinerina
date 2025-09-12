import 'package:cinerina/core/database/drift.dart';
import 'package:cinerina/feature/favorites/data/favorites_repository.dart';
import 'package:cinerina/feature/favorites/model/favorites_model.dart';

final class IFavoritesRepository implements FavoritesRepository {
  final AppDatabase _appDatabase;

  IFavoritesRepository({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;

  @override
  Future<int> addFavorites(FavoritesModel model) async {
    return await _appDatabase
        .into(_appDatabase.searchDriftModel)
        .insert(model.toDriftCompanion());
  }

  @override
  Future<List<FavoritesModel>> getFavorites() async {
    final listFavorites = await _appDatabase
        .select(_appDatabase.searchDriftModel)
        .get();

    return listFavorites
        .map(
          (e) => e.toFavorite()
        )
        .toList();
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    final delete = _appDatabase.delete(_appDatabase.searchDriftModel);
    await (delete..where((e) => e.id.equals(id))).go();
  }

  @override
  Future<void> resetFavorites() async {
    await _appDatabase.delete(_appDatabase.searchDriftModel).go();
  }
}
