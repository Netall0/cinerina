import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CompositionRoot {
  Future<InheritedResult> compose() async {
    final Stopwatch stopwatch = Stopwatch()..start();

    final logger = AppLogger();

    logger.info('App run time: ${stopwatch.elapsed}');

    final depend = await _initDepend(logger);

    final result = InheritedResult(
      ms: stopwatch.elapsedMilliseconds,
      dependModel: depend,
    );

    stopwatch.stop();

    logger.info('App run time: ${stopwatch.elapsed}');
    return result;
  }

  Future<DependContainer> _initDepend(AppLogger logger) async {
    final sharedPreferences = await _initSharedPreferences(logger);
    final dio = _initDio(logger);

    return DependContainer(sharedPreferences: sharedPreferences, dio: dio);
  }

  /// Инициализация SharedPreferences
  Future<SharedPreferences> _initSharedPreferences(AppLogger logger) async {
    logger.debug('Инициализация SharedPreferences...');
    final prefs = await SharedPreferences.getInstance();
    logger.debug('SharedPreferences инициализированы');
    return prefs;
  }

  /// Инициализация Dio
  Dio _initDio(AppLogger logger) {
    logger.debug('Создание Dio...');
    final dio = Dio();
    // тут можно добавить interceptors, baseUrl и т.д.
    logger.debug('Dio создан');
    return dio;
  }
}
