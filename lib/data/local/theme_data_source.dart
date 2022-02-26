import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataSource {
  ThemeDataSource({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  static const String keyThemeMode = 'theme_mode';

  final SharedPreferences _prefs;

  ThemeMode? loadThemeMode() {
    final key = _prefs.getString(keyThemeMode);
    return ThemeMode.values.firstWhereOrNull((element) => element.name == key);
  }

  Future<void> saveThemeMode(ThemeMode theme) {
    return _prefs.setString(
      keyThemeMode,
      theme.name,
    );
  }
}
