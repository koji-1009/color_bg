import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_hsv.freezed.dart';

@freezed
class ColorHSV with _$ColorHSV {
  const factory ColorHSV({
    @Default(0.0) double h,
    @Default(0.0) double s,
    @Default(0.0) double v,
  }) = _ColorHSV;
}
