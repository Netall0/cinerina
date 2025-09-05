abstract interface class SearchHistoryRepository {
  Future<void> addSearchHistory(String query);
  Future<List<String>> getSearchHistory();
  Future<void> resetSearchHistory();
  Future<void> removeFromHistory(String query);
}
