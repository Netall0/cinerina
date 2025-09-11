import 'package:cinerina/feature/history/data/search_history_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ISearchHistoryRepository implements SearchHistoryRepository {
  final SharedPreferences _sharedPreferences;
  static const String _searchHistoryKey = 'search_history';

  ISearchHistoryRepository({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<void> addSearchHistory(String query) async {
    if (query.trim().isEmpty) return;

    final history =
        _sharedPreferences.getStringList(_searchHistoryKey) ?? <String>[];
    history.remove(query.trim());
    history.insert(0, query.trim());

    if (history.length > 15) {
      history.removeRange(15, history.length);
    }

    await _sharedPreferences.setStringList(_searchHistoryKey, history);
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return _sharedPreferences.getStringList(_searchHistoryKey) ?? <String>[];
  }

  @override
  Future<void> resetSearchHistory() async {
    await _sharedPreferences.remove(_searchHistoryKey);
  }

  @override
  Future<void> removeFromHistory(String query) async {
    final history =
        _sharedPreferences.getStringList(_searchHistoryKey) ?? <String>[];
    history.remove(query);
    await _sharedPreferences.setStringList(_searchHistoryKey, history);
  }
}
