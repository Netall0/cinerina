import 'package:cinerina/core/database/drift.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/favorites/data/favorites_repository.dart';
import 'package:cinerina/feature/favorites/model/favorites_model.dart';

final class IFavoritesRepository with LoggerMixin implements FavoritesRepository {
  final AppDatabase _appDatabase;

  IFavoritesRepository({required AppDatabase appDatabase})
    : _appDatabase = appDatabase;

  @override
  Future<int> addFavorites(FavoritesModel model) async {
    try {
      // Проверяем, существует ли уже такой элемент
      final exists = await isInFavorites(model.id);
      if (exists) {
        throw Exception('Item with id ${model.id} already exists in favorites');
      }

      return await _appDatabase
          .into(_appDatabase.searchDriftModel)
          .insert(model.toDriftCompanion());
    } catch (e) {
      // Логируем ошибку и перебрасываем
      print('Error adding to favorites: $e');
      rethrow;
    }
  }

  @override
  Future<List<FavoritesModel>> getFavorites() async {
    try {
      final listFavorites = await _appDatabase
          .select(_appDatabase.searchDriftModel)
          .get();

      return listFavorites.map((e) => e.toFavorite()).toList();
    } catch (e) {
      print('Error getting favorites: $e');
      return []; // Возвращаем пустой список при ошибке
    }
  }

  @override
  Future<void> removeFromFavorites(int id) async {
    try {
      // Проверяем, существует ли элемент перед удалением
      final exists = await isInFavorites(id);
      if (!exists) {
        throw Exception('Item with id $id not found in favorites');
      }

      final delete = _appDatabase.delete(_appDatabase.searchDriftModel);
      final rowsAffected = await (delete..where((e) => e.id.equals(id))).go();

      if (rowsAffected == 0) {
        throw Exception('Failed to remove item with id $id from favorites');
      }
    } catch (e) {
      print('Error removing from favorites: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isInFavorites(int id) async {
    try {
      final query = _appDatabase.select(_appDatabase.searchDriftModel)
        ..where((tbl) => tbl.id.equals(id));

      final result = await query.getSingleOrNull();
      return result != null;
    } catch (e) {
      print('Error checking if item is in favorites: $e');
      return false; // При ошибке считаем, что элемента нет
    }
  }

  @override
  Future<void> resetFavorites() async {
    try {
      final rowsAffected = await _appDatabase
          .delete(_appDatabase.searchDriftModel)
          .go();

      print('Removed $rowsAffected items from favorites');
    } catch (e) {
      print('Error resetting favorites: $e');
      rethrow;
    }
  }

  @override
  Future<int> getFavoritesCount() async {
    try {
      final query = _appDatabase.select(_appDatabase.searchDriftModel);
      final results = await query.get();
      return results.length;
    } catch (e) {
      logDebug('Error getting favorites count: $e');
      return 0;
    }
  }

  /// Безопасно добавляет элемент в избранное (не выбрасывает исключение если уже существует)
  Future<bool> addFavoritesSafe(FavoritesModel model) async {
    try {
      final movieId = model.movie?.id ?? 0;
      if (movieId == 0) {
        return false;
      }

      final exists = await isInFavorites(movieId);
      if (exists) {
        return false; // Элемент уже существует
      }

      final result = await _appDatabase
          .into(_appDatabase.searchDriftModel)
          .insert(model.toDriftCompanion());

      return result > 0; // Успешно добавлен
    } catch (e) {
      logDebug('Error safely adding to favorites: $e');
      return false;
    }
  }

  /// Переключает состояние избранного (добавляет если нет, удаляет если есть)
  Future<bool> toggleFavorite(FavoritesModel model) async {
    try {
      final movieId = model.movie?.id ?? DateTime.now().millisecondsSinceEpoch;
      if (movieId == 0) {
        return false;
      }

      final exists = await isInFavorites(movieId);

      if (exists) {
        await removeFromFavorites(movieId);
        return false; // Удалили из избранного
      } else {
        final result = await _appDatabase
            .into(_appDatabase.searchDriftModel)
            .insert(model.toDriftCompanion());
        return result > 0; // Добавили в избранное
      }
    } catch (e) {
      logDebug('Error toggling favorite: $e');
      return false;
    }
  }
}
