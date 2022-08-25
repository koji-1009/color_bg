import 'package:color_bootcamp/data/model/history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final hiveHistoryBoxProvider = Provider<Box<History>>(
  (ref) => throw Exception('Provider was not initialized'),
);
