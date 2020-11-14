import 'package:flutter/foundation.dart';

enum AppErrorType { network, server, cancel, unknown }

class AppError {
  AppError(dynamic error) {
    if (error is Error) {
      debugPrint('AppError(Error): ${error.stackTrace.toString()}');
      type = AppErrorType.unknown;
      message = 'AppError: ${error.stackTrace.toString()}';
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }

  String message;
  AppErrorType type;
}
