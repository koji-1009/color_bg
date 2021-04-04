import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants.dart';
import '../app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              PopupMenuButton<ThemeMode>(
                onSelected: (result) async {
                  final appTheme = context.read(appThemeNotifierProvider);
                  await appTheme.updateTheme(result);
                },
                itemBuilder: (context) => <PopupMenuEntry<ThemeMode>>[
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.light,
                    child: Text('Light theme'),
                  ),
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.dark,
                    child: Text('Dark theme'),
                  ),
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.system,
                    child: Text('System settings'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Constants.pageRgb,
                  );
                },
                child: const Text('RGB'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Constants.pageHsv,
                  );
                },
                child: const Text('HSV'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
