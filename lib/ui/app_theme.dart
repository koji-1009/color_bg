import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/app_error.dart';
import '../data/model/theme_setting.dart';
import '../data/provider/theme_repository_provider.dart';
import '../data/repository/theme_repository.dart';
import 'change_notifier_with_error_handle.dart';

final appThemeNotifierProvider =
    ChangeNotifierProvider<AppTheme>((ref) => AppTheme(ref));

ThemeData get lightTheme {
  return ThemeData.from(colorScheme: const ColorScheme.light());
}

ThemeData get darkTheme {
  return ThemeData.from(colorScheme: const ColorScheme.dark());
}

class AppTheme extends AppChangeNotifier {
  AppTheme(ProviderReference ref)
      : _ref = ref,
        super(ref);

  static const _defaultThemeSetting = ThemeSetting.light;

  final ProviderReference _ref;

  ThemeRepository _repository;

  ThemeSetting _setting;

  ThemeSetting get setting => _setting;

  Future<ThemeData> get themeData async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository.loadThemeSetting() ?? _defaultThemeSetting;
    }
    return setting == ThemeSetting.light ? lightTheme : darkTheme;
  }

  Future<void> _loadLightTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.light;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadDarkTheme() async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeSetting.dark;
    await _repository
        .saveThemeSetting(setting)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> toggle() async {
    setting == ThemeSetting.light
        ? await _loadDarkTheme()
        : await _loadLightTheme();
  }
}
