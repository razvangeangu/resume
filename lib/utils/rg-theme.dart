import 'package:flutter/material.dart';

class RGTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.black87,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.white30,
    );
  }
}
