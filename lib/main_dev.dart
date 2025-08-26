// lib/main_dev.dart
import 'dart:async';

import 'package:cinerina/core/config/app_config.dart';
import 'package:cinerina/feature/app/logic/runner.dart';

import 'package:cinerina/core/util/logger.dart';

void main() async {
 AppRunner().runner(AppEnvironment.development);
}
