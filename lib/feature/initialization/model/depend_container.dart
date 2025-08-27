import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DependContainer {
  DependContainer({required this.sharedPreferences, required this.dio,});
  final SharedPreferences sharedPreferences;
  final Dio dio;
}

final class InheritedResult {
  InheritedResult({required this.dependModel, required this.ms});
  final DependContainer dependModel;

  final int ms;
}
