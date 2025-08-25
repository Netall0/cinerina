// lib/main_dev.dart
import 'dart:async';

import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/logic/runner.dart';

void main() async {
  runZonedGuarded(() => runner(AppEnvironment.development),(
    Object error, 
    StackTrace stack
  ){
    print(error);
    print(stack);
  });
}
