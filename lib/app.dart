import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants.dart';
import 'ui/app_theme.dart';
import 'ui/home.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = useProvider(appThemeNotifierProvider);
    final themeData = useMemoized(
      () => appTheme.themeData,
      [appTheme.setting],
    );
    final snapshot = useFuture(themeData);

    return snapshot.hasData
        ? MaterialApp(
            title: Constants.appName,
            theme: snapshot.data ?? lightTheme,
            darkTheme: darkTheme,
            home: HomePage(title: Constants.appName),
          )
        : const Center(child: CircularProgressIndicator());
  }
}