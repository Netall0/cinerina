import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel {
  debug(0, 'DEBUG'),
  info(1, 'INFO'),
  warn(2, 'WARN'),
  error(3, 'ERROR'),
  fatal(4, 'FATAL');

  const LogLevel(this.level, this.name);
  final int level;
  final String name;
}

class AppLogger {
  // КЛАССИЧЕСКИЙ СИНГЛТОН
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;
  AppLogger._internal();

  static AppLogger get instance => _instance;
  final _minLevel = kDebugMode ? LogLevel.debug : LogLevel.warn;

  // Основные методы логирования с контекстом
  void debug(
    String message, {
    String? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.debug, message, context, error, stackTrace);
  }

  void info(
    String message, {
    String? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.info, message, context, error, stackTrace);
  }

  void warn(
    String message, {
    String? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.warn, message, context, error, stackTrace);
  }

  void error(
    String message, {
    String? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.error, message, context, error, stackTrace);
  }

  void fatal(
    String message, {
    String? context,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(LogLevel.fatal, message, context, error, stackTrace);
  }

  void _log(
    LogLevel level,
    String message,
    String? context, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (level.level < _minLevel.level) return;

    final timestamp = DateTime.now();
    final timeStr =
        '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}.'
        '${timestamp.millisecond.toString().padLeft(3, '0')}';

    final contextStr = context != null ? '[$context] ' : '';
    final logMessage = '[$timeStr] $contextStr${level.name}: $message';

    if (kDebugMode) {
      final buffer = StringBuffer();
      buffer.writeln(logMessage);
      if (error != null) buffer.writeln(error);
      if (stackTrace != null) {
        final lines = stackTrace.toString().split('\n').take(5);
        for (final line in lines) {
          buffer.writeln('  $line');
        }
      }
      developer.log(
        buffer.toString(),
        name: 'AppLogger${context != null ? '.$context' : ''}',
        level: _getDeveloperLevel(level),
      );
    } else {
      developer.log(
        logMessage,
        name: 'AppLogger${context != null ? '.$context' : ''}',
        level: _getDeveloperLevel(level),
      );
    }
  }

  int _getDeveloperLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warn:
        return 900;
      case LogLevel.error:
      case LogLevel.fatal:
        return 1000;
    }
  }
}

mixin LoggerMixin {
  String get _loggerContext => runtimeType.toString();

  final AppLogger _logger = AppLogger();

  void logDebug(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.debug(
        message,
        error: error,
        stackTrace: stackTrace,
      );

  void logInfo(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.info(
        message,
        context: _loggerContext,
        error: error,
        stackTrace: stackTrace,
      );

  void logWarn(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.warn(
        message,
        context: _loggerContext,
        error: error,
        stackTrace: stackTrace,
      );

  void logError(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.error(
        message,
        context: _loggerContext,
        error: error,
        stackTrace: stackTrace,
      );

  void logFatal(String message, [Object? error, StackTrace? stackTrace]) =>
      _logger.fatal(
        message,
        context: _loggerContext,
        error: error,
        stackTrace: stackTrace,
      );
}


