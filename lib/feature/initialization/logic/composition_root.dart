import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:cinerina/feature/search/data/i_search_history_repository.dart';
import 'package:cinerina/feature/search/data/i_search_repository.dart';
import 'package:cinerina/feature/settings/controller/settings_controller.dart';
import 'package:cinerina/feature/settings/data/i_settings_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uikit/utils/layout_type_enum.dart';

final class CompositionRoot with LoggerMixin {
  Future<InheritedResult> compose() async {
    final Stopwatch stopwatch = Stopwatch()..start();

    logInfo('App run time: ${stopwatch.elapsed}');

    final depend = await _initDepend();

    final result = InheritedResult(
      ms: stopwatch.elapsedMilliseconds,
      dependModel: depend,
    );

    stopwatch.stop();

    logInfo('App run time: ${stopwatch.elapsed}');
    return result;
  }

  Future<DependContainer> _initDepend() async {
    final sharedPreferences = await _initSharedPreferences();
    final dio = _initDio();

    final settingsRepository = _initSettingsRepository(sharedPreferences);
    final searchRepository = _initSearchRepository(dio);

    final searchHistoryRepository = _initSearchHistoryRepository(
      sharedPreferences,
    );

    final themeController = _initSettingsController(settingsRepository);
    final searchBloc = _initSearchBloc(
      searchRepository,
      searchHistoryRepository,
    );

    return DependContainer(
      searchBloc: searchBloc,
      sharedPreferences: sharedPreferences,
      dio: dio,
      themeController: themeController,
    );
  }

  ISearchHistoryRepository _initSearchHistoryRepository(
    SharedPreferences sharedPreferences,
  ) {
    logDebug('Создание SearchHistoryRepository...');
    final repo = ISearchHistoryRepository(sharedPreferences: sharedPreferences);
    logDebug('SearchHistoryRepository создан');
    return repo;
  }

  /// SharedPreferences
  Future<SharedPreferences> _initSharedPreferences() async {
    logDebug('Инициализация SharedPreferences...');
    final prefs = await SharedPreferences.getInstance();
    logDebug('SharedPreferences инициализированы');
    return prefs;
  }

  Dio _initDio() {
    logDebug('Создание Dio...');
    final dio = Dio();
    logDebug('Инициализация SharedPreferences...');
    ('Dio создан');
    return dio;
  }

  /// Репозиторий настроек
  ISettingsRepository _initSettingsRepository(
    SharedPreferences sharedPreferences,
  ) {
    logDebug('Создание SettingsRepository...');
    final repo = ISettingsRepository(sharedPreferences: sharedPreferences);
    logDebug('SettingsRepository создан');
    return repo;
  }

  /// Репозиторий поиска
  ISearchRepository _initSearchRepository(Dio dio) {
    logDebug('Создание SearchRepository...');
    final repo = ISearchRepository(dio: dio);
    logDebug('SearchRepository создан');
    return repo;
  }

  /// Контроллер настроек
  SettingsController _initSettingsController(
    ISettingsRepository settingsRepository,
  ) {
    logDebug('Создание SettingsController...');
    final controller = SettingsController(
      brightness: Brightness.dark,
      themeRepository: settingsRepository,
      layoutType: LayoutType.list,
    );
    logDebug('SettingsController создан');
    return controller;
  }

  /// Блок поиска
  SearchBloc _initSearchBloc(
    ISearchRepository searchrepository,
    ISearchHistoryRepository searchHistoryRepository,
  ) {
    logDebug('Создание SearchBloc...');
    final bloc = SearchBloc(
      searchRepository: searchrepository,
      searchHistoryRepository: searchHistoryRepository,
    );
    logDebug('SearchBloc создан');
    return bloc;
  }
}
