// lib/main_dev.dart
import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  
  // Настройки для разработки
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Показать конфиг в консоли
  debugPrint('🚀 Starting app in DEVELOPMENT mode');
  debugPrint('📡 API Key: ${AppConfig.apiKey}');
  debugPrint('🏗️ Environment: ${AppConfig.environment}');
  
  runApp( AppRoot(pref: pref,));
}