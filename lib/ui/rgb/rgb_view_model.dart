import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/color_rgb.dart';
import '../change_notifier_with_error_handle.dart';

final rgbViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => RgbViewModel(ref));

class RgbViewModel extends AppChangeNotifier {
  RgbViewModel(ProviderReference ref) : super(ref) {
    _answer = ColorRGB(
      r: 125,
      g: 125,
      b: 125,
    );

    changeColor();
  }

  final _random = Random();

  ColorRGB _question;

  ColorRGB get question => _question;

  ColorRGB _answer;

  ColorRGB get answer => _answer;

  void changeColor() {
    _question = ColorRGB(
      r: _random.nextInt(256),
      g: _random.nextInt(256),
      b: _random.nextInt(256),
    );

    notifyListeners();
  }

  void update({
    int r,
    int g,
    int b,
  }) {
    _answer = _answer.copyWith(
      r: r ?? _answer.r,
      g: g ?? _answer.g,
      b: b ?? _answer.b,
    );

    notifyListeners();
  }
}
