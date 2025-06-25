// Copyright © 2025 ADA 4th Challenge3 Team1. All rights reserved.

import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      printEmojis: true,
    ),
  );

  static void d(String message) {
    _logger.d(message);
  }

  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void w(String message) {
    _logger.w(message);
  }

  static void i(String message) {
    _logger.i(message);
  }
}

class Log {
  static void d(String message) => AppLogger.d(message);
  static void e(String message, [Object? error, StackTrace? stackTrace]) => 
      AppLogger.e(message, error, stackTrace);
  static void w(String message) => AppLogger.w(message);
  static void i(String message) => AppLogger.i(message);
}

extension LoggerExtension on Object {
  void logD(String message) {
    Log.d('[$runtimeType] $message');
  }

  void logE(String message, [Object? error]) {
    Log.e('[$runtimeType] $message', error);
  }

  void logW(String message) {
    Log.w('[$runtimeType] $message');
  }
}