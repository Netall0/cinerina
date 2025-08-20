import 'dart:developer';
import 'dart:ui';

import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> runner(AppEnvironment environment) async {
  final binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  PlatformDispatcher.instance.onError = (error, stack) {
    print(error);
    return true;
  };

  FlutterError.onError = (FlutterErrorDetails details) {
    print(details);
  };

  final Stopwatch stopwatch = Stopwatch()..start();

  try {
    log('App run time: ${stopwatch.elapsed}');
    final pref = await SharedPreferences.getInstance();
    runApp(AppRoot(pref: pref));
    stopwatch.stop();
    log('App run time: ${stopwatch.elapsed}');
  } on Object catch (e) {
    print(e);
    print('App run time: ${stopwatch.elapsed}');
  } finally {
    binding.addPostFrameCallback((_) {
      binding.allowFirstFrame();
    });
  }
}
