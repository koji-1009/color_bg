import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_rgb.freezed.dart';

@freezed
abstract class ColorRGB with _$ColorRGB {
  factory ColorRGB({
    int r,
    int g,
    int b,
  }) = _ColorRGB;
}
