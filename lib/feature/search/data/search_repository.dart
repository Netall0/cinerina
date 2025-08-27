import 'package:cinerina/feature/search/model/search_model.dart';

abstract interface class SearchRepository {
  Future<List<SearchModel>> searchMovies(String query);
}
