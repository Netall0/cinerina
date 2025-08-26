// lib/main_prod.dart
import 'dart:async';

import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/logic/runner.dart';

void main() async { 
  AppRunner().runner(AppEnvironment.production);
}
