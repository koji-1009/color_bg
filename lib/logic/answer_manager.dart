import 'package:color_bootcamp/data/model/answer.dart';
import 'package:color_bootcamp/data/model/history.dart';
import 'package:color_bootcamp/data/model/play_mode.dart';
import 'package:color_bootcamp/data/provider/hive_history_box_provider.dart';
import 'package:color_bootcamp/logic/question_manager.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final answerProvider = StateNotifierProvider.autoDispose<AnswerManager, Answer>(
  (ref) => AnswerManager(
    question: ref.watch(questionProvider),
    historyBox: ref.watch(hiveHistoryBoxProvider),
  ),
);

class AnswerManager extends StateNotifier<Answer> {
  AnswerManager({
    required this.question,
    required this.historyBox,
  }) : super(Answer.create());

  final Color question;
  final Box<History> historyBox;

  ColorEntity get answer {
    switch (state.mode) {
      case PlayMode.rgb:
        return state.rgb;
      case PlayMode.hsv:
        return state.hsv;
    }
  }

  void changePlayMode({
    required PlayMode mode,
  }) {
    state = state.copyWith(
      mode: mode,
    );
  }

  void updateR(int value) {
    state = state.copyWith(
      rgb: state.rgb.copyWith(
        r: value,
      ),
    );
  }

  void updateG(int value) {
    state = state.copyWith(
      rgb: state.rgb.copyWith(
        g: value,
      ),
    );
  }

  void updateB(int value) {
    state = state.copyWith(
      rgb: state.rgb.copyWith(
        b: value,
      ),
    );
  }

  void updateH(double value) {
    state = state.copyWith(
      hsv: state.hsv.copyWith(
        h: value,
      ),
    );
  }

  void updateS(double value) {
    state = state.copyWith(
      hsv: state.hsv.copyWith(
        s: value,
      ),
    );
  }

  void updateV(double value) {
    state = state.copyWith(
      hsv: state.hsv.copyWith(
        v: value,
      ),
    );
  }

  int checkTimes() {
    state = state.copyWith(
      checkTimes: state.checkTimes + 1,
    );

    return state.checkTimes;
  }

  String scoreText() {
    switch (state.mode) {
      case PlayMode.rgb:
        return _checkRGB(
          question: question,
          answer: state.rgb,
        );
      case PlayMode.hsv:
        return _checkHSV(
          question: HSVColor.fromColor(question),
          answer: state.hsv,
        );
    }
  }

  void saveResult() {
    historyBox.add(
      History(
        dateTime: DateTime.now(),
        question: question,
        answer: HistoryAnswer(
          hsvColor: state.hsv.color,
          rgbColor: state.rgb.color,
          checkTimes: state.checkTimes,
        ),
        score: scoreText(),
      ),
    );
  }

  String _checkRGB({
    required Color question,
    required ColorRGB answer,
  }) {
    final result = (question.red - answer.r).abs() +
        (question.green - answer.g).abs() +
        (question.blue - answer.b).abs();

    if (result <= 3) {
      return 'Perfect!!!';
    } else if (result <= 15) {
      return 'Excellent!';
    } else if (result <= 30) {
      return 'Good';
    } else if (result <= 60) {
      return 'Fair';
    } else if (result <= 100) {
      return 'Poor...';
    } else {
      return 'Wrong';
    }
  }

  String _checkHSV({
    required HSVColor question,
    required ColorHSV answer,
  }) {
    final result = (question.hue - answer.h).abs() +
        (question.saturation * 100 - answer.s * 100).abs() +
        (question.value * 100 - answer.v * 100).abs();

    if (result <= 3) {
      return 'Perfect!!!';
    } else if (result <= 10) {
      return 'Excellent!';
    } else if (result <= 30) {
      return 'Good';
    } else if (result <= 60) {
      return 'Fair';
    } else if (result <= 100) {
      return 'Poor...';
    } else {
      return 'Wrong';
    }
  }
}
