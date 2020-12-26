import 'package:flutter/material.dart';

class RGColors {
  static const MaterialColor primary = MaterialColor(
    _primaryMainValue,
    <int, Color>{
      50: Color(0xFFEFEEF8),
      100: Color(0xFFDFDEF2),
      200: Color(0xFFBFBDE5),
      300: Color(0xFF9F9CD9),
      400: Color(0xFF7F7BCC),
      500: Color(_primaryMainValue),
      600: Color(0xFF4C4899),
      700: Color(0xFF393673),
      800: Color(0xFF26244C),
      900: Color(0xFF131226),
    },
  );
  static const int _primaryMainValue = 0xFF605BC0;
}
