import 'package:flutter/painting.dart';

import '../../data/model/color_value.dart';

extension ColorValueExt on ColorValue {
  Color get color => Color.fromARGB(255, r, g, b);
}
