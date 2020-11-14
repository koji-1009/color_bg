import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/model/color_value.dart';
import 'change_notifier_with_error_handle.dart';

final homeViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => HomeViewModel(ref));

class HomeViewModel extends AppChangeNotifier {
  HomeViewModel(ProviderReference ref) : super(ref) {
    _answer = ColorValue(
      r: 0,
      g: 0,
      b: 0,
    );

    changeColor();
  }

  final _random = Random();

  ColorValue _question;

  ColorValue _answer;

  ColorValue get question => _question;

  ColorValue get answer => _answer;

  void changeColor() {
    _question = ColorValue(
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
