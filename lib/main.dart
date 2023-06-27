import 'package:color_bootcamp/app.dart';
import 'package:color_bootcamp/data/model/history.dart';
import 'package:color_bootcamp/data/provider/hive_history_box_provider.dart';
import 'package:color_bootcamp/data/provider/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  await Hive.initFlutter();
  Hive
    ..registerAdapter(HistoryAdapter())
    ..registerAdapter(HistoryAnswerAdapter())
    ..registerAdapter(ColorAdapter())
    ..registerAdapter(HSVColorAdapter());
  final historyBox = await Hive.openBox<History>('history');

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        hiveHistoryBoxProvider.overrideWithValue(historyBox),
        prefsProvider.overrideWithValue(prefs),
      ],
      child: const App(),
    ),
  );
}
