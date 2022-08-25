import 'package:flutter/painting.dart';

extension ColorExt on Color {
  HSVColor get hsv => HSVColor.fromColor(this);
}

extension HSVColorExt on HSVColor {
  Color get rgb => toColor();
}
