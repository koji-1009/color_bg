import 'package:color_bootcamp/data/model/play_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    @Default(PlayMode.rgb) PlayMode mode,
    required ColorRGB rgb,
    required ColorHSV hsv,
    @Default(0) int checkTimes,
  }) = _Answer;

  factory Answer.create() => const Answer(
        rgb: ColorRGB(),
        hsv: ColorHSV(),
      );
}

@freezed
class ColorEntity with _$ColorEntity {
  const factory ColorEntity.rgb({
    @Default(125) int r,
    @Default(125) int g,
    @Default(125) int b,
  }) = ColorRGB;

  const factory ColorEntity.hsv({
    @Default(0.0) double h,
    @Default(0.0) double s,
    @Default(0.0) double v,
  }) = ColorHSV;
}

extension ColorEntityExt on ColorEntity {
  Color get color {
    return when(
      rgb: (r, g, b) => Color.fromARGB(255, r, g, b),
      hsv: (h, s, v) => HSVColor.fromAHSV(1, h, s, v).toColor(),
    );
  }
}
