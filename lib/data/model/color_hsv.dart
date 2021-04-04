import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'color_hsv.freezed.dart';

@freezed
class ColorHSV with _$ColorHSV {
  factory ColorHSV({
    required double h,
    required double s,
    required double v,
  }) = _ColorHSV;
}
