import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_value.freezed.dart';

@freezed
abstract class ColorValue with _$ColorValue {
  factory ColorValue({
    int r,
    int g,
    int b,
  }) = _ColorValue;
}
