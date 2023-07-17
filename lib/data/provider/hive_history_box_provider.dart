import 'package:color_bootcamp/data/model/history.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_history_box_provider.g.dart';

@riverpod
Box<History> hiveHistoryBox(_) =>
    throw Exception('Provider was not initialized');
