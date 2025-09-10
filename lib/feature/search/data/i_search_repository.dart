import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/search/data/search_repository.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:dio/dio.dart';

final class ISearchRepository with LoggerMixin implements SearchRepository {
  ISearchRepository({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<SearchModel> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        'https://api.kinopoisk.dev/v1.4/movie/search?&query=$query',
        options: Options(headers: {'X-API-KEY': AppConfig.apiKey}),
      );

      logInfo('Успешный поиск для запроса: $query');
      logDebug('Response status: ${response.statusCode}');

      return SearchModel.fromJson(response.data);
    } on Object catch (e) {
      logError('Произошла ошибка при поиске "$query": ${e.toString()}');
      return SearchModel();
    }
  }
}
