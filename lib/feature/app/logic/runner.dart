import 'dart:developer';
import 'dart:ui';
import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/widget/app_scope.dart';
import 'package:cinerina/feature/initialization/logic/composition_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    final result = await CompositionRoot().compose();
    runApp(AppScope(dependModel:result.dependModel ));
    stopwatch.stop();
    log('App run time: ${stopwatch.elapsed}');
  } on Object catch (e) {
  } finally {
    binding.addPostFrameCallback((_) {
      binding.allowFirstFrame();
    });
  }
}
