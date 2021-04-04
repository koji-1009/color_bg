import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_rgb.freezed.dart';

@freezed
class ColorRGB with _$ColorRGB {
  factory ColorRGB({
    required int r,
    required int g,
    required int b,
  }) = _ColorRGB;
}
