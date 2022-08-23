import 'package:flutter/painting.dart';

extension ColorExt on Color {
  HSVColor get hsv => HSVColor.fromColor(this);
}
