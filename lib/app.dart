import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/home/home.dart';
import 'ui/hsv/hsv.dart';
import 'ui/rgb/rgb.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);
    final themeMode = useMemoized(() => appTheme.themeMode, [appTheme.setting]);
    final snapshot = useFuture(themeMode);

    return MaterialApp(
      title: Constants.appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: snapshot.data ?? ThemeMode.system,
      home: const HomePage(),
      routes: {
        Constants.pageHome: (_) => const HomePage(),
        Constants.pageRgb: (_) => const RgbPage(),
        Constants.pageHsv: (_) => const HsvPage(),
      },
    );
  }
}
