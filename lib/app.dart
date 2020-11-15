import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/component/loading.dart';
import 'ui/home/home.dart';
import 'ui/rgb/rgb.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);
    final themeMode = useMemoized(() => appTheme.themeMode, [appTheme.setting]);
    final snapshot = useFuture(themeMode);

    return snapshot.hasData
        ? MaterialApp(
            title: Constants.appName,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: snapshot.data ?? ThemeMode.system,
            home: HomePage(),
            routes: {
              Constants.pageHome: (context) => HomePage(),
              Constants.pageRgb: (context) => RgbPage(),
            },
          )
        : const Loading();
  }
}
