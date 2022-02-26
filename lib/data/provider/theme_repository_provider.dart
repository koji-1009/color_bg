import 'package:color_bootcamp/data/repository/theme_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme_data_source_provider.dart';

final themeRepositoryProvider = FutureProvider(
  (ref) async => ThemeRepository(
    dataSource: await ref.read(themeDataSourceProvider.future),
  ),
);
