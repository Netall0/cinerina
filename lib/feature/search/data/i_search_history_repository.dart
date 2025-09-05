import 'package:cinerina/feature/search/data/search_history_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ISearchHistoryRepository implements SearchHistoryRepository {
  final SharedPreferences _sharedPreferences;

  final String _searchHistoryKey = 'search_history';

  ISearchHistoryRepository({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<void> addSearchHistory(String query) async {
    await _sharedPreferences.setStringList(_searchHistoryKey, [query]);
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return _sharedPreferences.getStringList(_searchHistoryKey) ?? <String>[];
  }

  @override
  Future<void> resetSearchHistory() {
    return _sharedPreferences.clear();
  }

  @override
  Future<void> removeFromHistory(String query) {
    final history = _sharedPreferences.getStringList(_searchHistoryKey) ?? <String>[];

    return _sharedPreferences.setStringList(_searchHistoryKey, history..remove(query));
  }
}
