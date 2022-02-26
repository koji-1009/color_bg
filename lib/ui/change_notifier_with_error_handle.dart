import 'package:color_bootcamp/data/app_error.dart';
import 'package:color_bootcamp/ui/error_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppChangeNotifier extends ChangeNotifier {
  AppChangeNotifier(Ref ref) : _errorNotifier = ref.read(errorNotifierProvider);

  final ErrorNotifier _errorNotifier;

  void doOnError(AppError appError) {
    _errorNotifier.doOnError(appError);
  }

  void doOnSuccess() {
    _errorNotifier.doOnSuccess();
  }
}
