import 'dart:math';

import 'package:color_bootcamp/data/model/color_hsv.dart';
import 'package:color_bootcamp/ui/change_notifier_with_error_handle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hsvViewModelNotifierProvider = ChangeNotifierProvider<HsvViewModel>(
  HsvViewModel.new,
);

class HsvViewModel extends AppChangeNotifier {
  HsvViewModel(Ref ref) : super(ref) {
    _answer = const ColorHSV();

    changeColor();
  }

  final _random = Random();

  late ColorHSV _question;

  ColorHSV get question => _question;

  late ColorHSV _answer;

  ColorHSV get answer => _answer;

  int checkTimes = 0;

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
    double? h,
    double? s,
    double? v,
  }) {
    _answer = _answer.copyWith(
      h: h ?? _answer.h,
      s: s ?? _answer.s,
      v: v ?? _answer.v,
    );

    notifyListeners();
  }
}
