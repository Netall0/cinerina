import 'package:cinerina/core/database/drift.dart';
import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/favorites/bloc/favorites_bloc.dart';
import 'package:cinerina/feature/history/bloc/history_bloc.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:cinerina/feature/settings/controller/settings_controller.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DependContainer {
  DependContainer({
    required this.sharedPreferences,
    required this.dio,
    required this.themeController,
    required this.searchBloc,
    required this.historyBloc,
    required this.appDatabase,
    required this.favoritesBloc,
    required this.authBloc
  });
  final AuthBloc authBloc;
  final AppDatabase appDatabase;
  final FavoritesBloc favoritesBloc;
  final SharedPreferences sharedPreferences;
  final Dio dio;
  final SettingsController themeController;
  final SearchBloc searchBloc;
  final HistoryBloc historyBloc;
}

final class InheritedResult {
  InheritedResult({required this.dependModel, required this.ms});
  final DependContainer dependModel;

  final int ms;
}
