import 'dart:async';
import 'dart:ui';
import 'package:cinerina/core/bloc/bloc_observer.dart';
import 'package:cinerina/core/bloc/bloc_transformer.dart';
import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/app/widget/app_scope.dart';
import 'package:cinerina/feature/initialization/logic/composition_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class AppRunner with LoggerMixin {
  Future<void> runner(AppEnvironment environment) async {
    runZonedGuarded(() async {
      final binding = WidgetsFlutterBinding.ensureInitialized()
        ..deferFirstFrame();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      Bloc.observer = AppBlocObserver();
      Bloc.transformer = BlocTransformer.sequential();

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
        await Supabase.initialize(
          url: 'https://tcvbawgyvgyjbmvgxnow.supabase.co',
          anonKey:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjdmJhd2d5dmd5amJtdmd4bm93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgyODY2NDIsImV4cCI6MjA3Mzg2MjY0Mn0.UjH_dh_OhBo9PXKgygjf0qIJ5c0h0SIKu2xwM6Nc9XM',
        );
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
