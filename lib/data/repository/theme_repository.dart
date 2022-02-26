import 'package:color_bootcamp/data/local/theme_data_source.dart';
import 'package:flutter/material.dart';

class ThemeRepository {
  ThemeRepository({
    required ThemeDataSource dataSource,
  }) : _dataSource = dataSource;

  final ThemeDataSource _dataSource;

  ThemeMode? loadThemeMode() {
    return _dataSource.loadThemeMode();
  }

  Future<void> saveThemeMode(ThemeMode theme) {
    return _dataSource.saveThemeMode(theme);
  }
}
