import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/app_error.dart';
import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';
import 'change_notifier_with_error_handle.dart';

final appThemeNotifierProvider =
    ChangeNotifierProvider<AppTheme>((ref) => AppTheme(ref));

ThemeData get lightTheme =>
    ThemeData.from(colorScheme: const ColorScheme.light());

ThemeData get darkTheme =>
    ThemeData.from(colorScheme: const ColorScheme.dark());

class AppTheme extends AppChangeNotifier {
  AppTheme(ProviderReference ref)
      : _ref = ref,
        super(ref);

  static const _defaultThemeMode = ThemeMode.light;

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeMode _setting;

  ThemeMode get setting => _setting;

  Future<ThemeMode> get themeMode async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository.loadThemeMode() ?? _defaultThemeMode;
    }
    return setting;
  }

  Future<void> _loadLightTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.light;
    await _repository
        .saveThemeMode(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadDarkTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.dark;
    await _repository
        .saveThemeMode(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadSystemTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.system;
    await _repository
        .saveThemeMode(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> updateTheme(ThemeMode setting) async {
    switch (setting) {
      case ThemeMode.light:
        await _loadLightTheme();
        break;
      case ThemeMode.dark:
        await _loadDarkTheme();
        break;
      case ThemeMode.system:
        await _loadSystemTheme();
        break;
    }
  }
}
