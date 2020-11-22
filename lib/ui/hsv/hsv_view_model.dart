import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/color_hsv.dart';
import '../change_notifier_with_error_handle.dart';

final hsvViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => HsvViewModel(ref));

class HsvViewModel extends AppChangeNotifier {
  HsvViewModel(ProviderReference ref) : super(ref) {
    _answer = ColorHSV(
      h: 0.0,
      s: 0.0,
      v: 0.0,
    );

    changeColor();
  }

  final _random = Random();

  ColorHSV _question;

  ColorHSV get question => _question;

  ColorHSV _answer;

  ColorHSV get answer => _answer;

  int checkTimes;

  void countUpCheckTimes() {
    checkTimes++;
  }

  void changeColor() {
    checkTimes = 0;

    _question = ColorHSV(
      h: _random.nextDouble() * 360,
      s: _random.nextDouble(),
      v: _random.nextDouble(),
    );

    notifyListeners();
  }

  void update({
    double h,
    double s,
    double v,
  }) {
    _answer = _answer.copyWith(
      h: h ?? _answer.h,
      s: s ?? _answer.s,
      v: v ?? _answer.v,
    );

    notifyListeners();
  }
}
