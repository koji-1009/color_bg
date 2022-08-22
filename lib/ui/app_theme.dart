import 'package:color_bootcamp/data/app_error.dart';
import 'package:color_bootcamp/data/provider/theme_repository_provider.dart';
import 'package:color_bootcamp/data/repository/theme_repository.dart';
import 'package:color_bootcamp/ui/change_notifier_with_error_handle.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeNotifierProvider = ChangeNotifierProvider<AppTheme>(
  AppTheme.new,
);

ThemeData get lightTheme => ThemeData(
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.light,
      useMaterial3: true,
    );

ThemeData get darkTheme => ThemeData(
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.dark,
      useMaterial3: true,
    );

class AppTheme extends AppChangeNotifier {
  AppTheme(Ref ref)
      : _ref = ref,
        super(ref);

  static const _defaultThemeMode = ThemeMode.light;

  final Ref _ref;

  ThemeRepository? _repository;

  ThemeMode? _setting;

  ThemeMode? get setting => _setting;

  Future<ThemeMode> get themeMode async {
    if (setting == null) {
      _repository ??= await _ref.read(themeRepositoryProvider.future);
      _setting = _repository?.loadThemeMode() ?? _defaultThemeMode;
    }
    return setting!;
  }

  Future<void> _loadLightTheme(WidgetRef ref) async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.light;
    await _repository!
        .saveThemeMode(setting!)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadDarkTheme(WidgetRef ref) async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.dark;
    await _repository!
        .saveThemeMode(setting!)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> _loadSystemTheme(WidgetRef ref) async {
    _repository ??= await _ref.read(themeRepositoryProvider.future);
    _setting = ThemeMode.system;
    await _repository!
        .saveThemeMode(setting!)
        .catchError((dynamic error) => doOnError(AppError(error)));
    notifyListeners();
  }

  Future<void> updateTheme(WidgetRef ref, ThemeMode setting) async {
    switch (setting) {
      case ThemeMode.light:
        await _loadLightTheme(ref);
        break;
      case ThemeMode.dark:
        await _loadDarkTheme(ref);
        break;
      case ThemeMode.system:
        await _loadSystemTheme(ref);
        break;
    }
  }
}
