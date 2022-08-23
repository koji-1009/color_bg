import 'package:color_bootcamp/data/local/theme_data_source.dart';
import 'package:color_bootcamp/data/provider/theme_data_source_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeNotifierProvider = StateNotifierProvider<AppTheme, ThemeMode>(
  (ref) => AppTheme(
    themeRepository: ref.watch(themeDataSourceProvider),
  ),
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

class AppTheme extends StateNotifier<ThemeMode> {
  AppTheme({
    required this.themeRepository,
  }) : super(themeRepository.themeMode);

  final ThemeDataSource themeRepository;

  void update(ThemeMode mode) {
    themeRepository.themeMode = mode;
    state = mode;
  }
}
