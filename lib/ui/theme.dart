import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme {
  final baseTheme = ThemeData(
    colorSchemeSeed: Colors.indigo,
    brightness: Brightness.light,
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}

ThemeData get darkTheme {
  final baseTheme = ThemeData(
    colorSchemeSeed: Colors.indigo,
    brightness: Brightness.dark,
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
