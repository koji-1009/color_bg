import 'package:color_bootcamp/data/model/color_hsv.dart';
import 'package:color_bootcamp/data/model/color_rgb.dart';
import 'package:flutter/painting.dart';

extension ColorRGBExt on ColorRGB {
  Color get color => Color.fromARGB(255, r, g, b);
}

extension ColorHSVExt on ColorHSV {
  Color get color => HSVColor.fromAHSV(1, h, s, v).toColor();
}
