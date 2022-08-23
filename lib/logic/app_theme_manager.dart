import 'package:color_bootcamp/data/local/theme_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeManager, ThemeMode>(
  (ref) => ThemeModeManager(
    themeDataSource: ref.watch(themeDataSourceProvider),
  ),
);

class ThemeModeManager extends StateNotifier<ThemeMode> {
  ThemeModeManager({
    required this.themeDataSource,
  }) : super(themeDataSource.themeMode);

  final ThemeDataSource themeDataSource;

  void update(ThemeMode mode) {
    themeDataSource.themeMode = mode;
    state = mode;
  }
}
