// lib/main_prod.dart
import 'package:cinerina/feature/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Настройки для продакшена
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Отключить дебаг в продакшене
  debugPrint = (String? message, {int? wrapWidth}) {};
  
  print('🚀 Starting app in PRODUCTION mode');
  print('📡 Using production API key');
  
  runApp(const MyApp());
}