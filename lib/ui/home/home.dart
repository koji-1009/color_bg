import 'package:color_bootcamp/constants.dart';
import 'package:color_bootcamp/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  primary: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
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
                style: ElevatedButton.styleFrom(
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  primary: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
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
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  showLicensePage(context: context);
                },
                icon: const Icon(Icons.info_outline),
              ),
              PopupMenuButton<ThemeMode>(
                onSelected: (result) async {
                  final appTheme = ref.read(appThemeNotifierProvider);
                  await appTheme.updateTheme(ref, result);
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
    );
  }
}
