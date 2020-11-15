import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_hsv.freezed.dart';

@freezed
abstract class ColorHSV with _$ColorHSV {
  factory ColorHSV({
    double h,
    double s,
    double v,
  }) = _ColorHSV;
}
