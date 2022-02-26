import 'package:color_bootcamp/data/local/theme_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared_preferences_provider.dart';

final themeDataSourceProvider = FutureProvider(
  (ref) async => ThemeDataSource(
    prefs: await ref.read(prefsProvider.future),
  ),
);
