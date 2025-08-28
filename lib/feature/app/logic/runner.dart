import 'dart:async';
import 'dart:ui';
import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/app/widget/app_scope.dart';
import 'package:cinerina/feature/initialization/logic/composition_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class AppRunner with LoggerMixin {
  Future<void> runner(AppEnvironment environment) async {
    runZonedGuarded(() async {
      final binding = WidgetsFlutterBinding.ensureInitialized()
        ..deferFirstFrame();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      PlatformDispatcher.instance.onError = (error, stack) {
        return true;
      };

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
        logError(details.exception.toString());
      };

      logInfo('Environment: ${environment.name}');

      final Stopwatch stopwatch = Stopwatch()..start();

      logInfo('App run time: ${stopwatch.elapsed}');

      try {
        logInfo('Starting app...');
        final result = await CompositionRoot().compose();
        runApp(AppScope(dependModel: result.dependModel));
        stopwatch.stop();

        logInfo('App run time: ${stopwatch.elapsed}');
      } on Object catch (e) {
        logError(e.toString());
      } finally {
        binding.addPostFrameCallback((_) {
          binding.allowFirstFrame();
        });
      }
    }, (error, stackTrace) => logError(error.toString(), stackTrace));
  }
}
