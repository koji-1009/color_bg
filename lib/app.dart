import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/home/home.dart';
import 'ui/hsv/hsv.dart';
import 'ui/rgb/rgb.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeNotifierProvider);

    return MaterialApp(
      title: 'Color BootCamp',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const HomePage(),
      routes: {
        Constants.pageHome: (_) => const HomePage(),
        Constants.pageRgb: (_) => const RgbPage(),
        Constants.pageHsv: (_) => const HsvPage(),
      },
    );
  }
}
