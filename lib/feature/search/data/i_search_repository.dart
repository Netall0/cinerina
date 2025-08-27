import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/search/data/search_repository.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:dio/dio.dart';

final class ISearchRepository with LoggerMixin implements SearchRepository {
  final dio = Dio();
  @override
  Future<List<SearchModel>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        'https://api.kinopoisk.dev/v1.4/movie/search?page=1&limit=10&query=f',
        options: Options(headers: {'X-API-KEY': AppConfig.apiKey}),
      );
      // Залогируйте весь ответ
      logInfo('Full response: ${response.data}');

      return (response.data['docs'] as List<dynamic>)
          .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Object catch (e) {
      logError('алах, $e');
    }
    return [];
  }
}
