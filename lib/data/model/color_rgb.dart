import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_rgb.freezed.dart';

@freezed
class ColorRGB with _$ColorRGB {
  const factory ColorRGB({
    @Default(125) int r,
    @Default(125) int g,
    @Default(125) int b,
  }) = _ColorRGB;
}
