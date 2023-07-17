import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_manager.g.dart';

@riverpod
Color question(_) => ColorExt.random();

final _seed = Random();

extension ColorExt on Color {
  static Color random() => Color.fromARGB(
        255,
        _seed.nextInt(256),
        _seed.nextInt(256),
        _seed.nextInt(256),
      );
}
