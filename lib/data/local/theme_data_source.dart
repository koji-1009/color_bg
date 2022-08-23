import 'package:color_bootcamp/data/provider/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeDataSourceProvider = Provider(
      (ref) => ThemeDataSource(
    prefs: ref.watch(prefsProvider),
  ),
);

class ThemeDataSource {
  ThemeDataSource({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  static const String keyThemeMode = 'theme_mode';

  final SharedPreferences _prefs;

  ThemeMode get themeMode {
    final key = _prefs.getString(keyThemeMode);
    return ThemeMode.values.firstWhere(
      (e) => e.name == key,
      orElse: () => ThemeMode.system,
    );
  }

  set themeMode(ThemeMode theme) {
    _prefs.setString(
      keyThemeMode,
      theme.name,
    );
  }
}
