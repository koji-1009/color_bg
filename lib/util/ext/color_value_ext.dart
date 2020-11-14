import 'package:flutter/painting.dart';

import '../../data/model/color_value.dart';

extension ColorValueExt on ColorValue {
  Color get color => Color.fromARGB(255, r, g, b);

  Color get colorR => Color.fromARGB(255, r, 0, 0);

  Color get colorG => Color.fromARGB(255, 0, g, 0);

  Color get colorB => Color.fromARGB(255, 0, 0, b);
}
