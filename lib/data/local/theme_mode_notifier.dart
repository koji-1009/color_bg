import 'package:color_bootcamp/data/provider/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const String keyThemeMode = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(prefsProvider);

    final key = prefs.getString(keyThemeMode);
    return ThemeMode.values.firstWhere(
      (e) => e.name == key,
      orElse: () => ThemeMode.system,
    );
  }

  void update(ThemeMode theme) {
    final prefs = ref.read(prefsProvider);

    prefs.setString(
      keyThemeMode,
      theme.name,
    );
    state = theme;

  }
}
