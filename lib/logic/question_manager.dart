import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionProvider = Provider.autoDispose(
  (_) => ColorExt.random(),
);

final _seed = Random();

extension ColorExt on Color {
  static Color random() => Color.fromARGB(
        255,
        _seed.nextInt(256),
        _seed.nextInt(256),
        _seed.nextInt(256),
      );
}
