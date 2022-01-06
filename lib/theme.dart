import 'package:flutter/material.dart';

// Orange - F0B67F
// Red - FE5F55
// Teal - D6D1B1
// Green - 81A480
// Light Green - EEF5DB

class CustomColors {
  CustomColors._();

  static const _orangePrimaryValue = 0xFFF0B67F;

  static const MaterialColor orange =
      MaterialColor(_orangePrimaryValue, <int, Color>{
    50: Color(0xFFe8d4c1),
    100: Color(0xFFebcfb5),
    200: Color(0xFFebc9a9),
    300: Color(0xFFebc39d),
    400: Color(0xFFedbe91),
    500: Color(_orangePrimaryValue),
    600: Color(0xFFd19f6f),
    700: Color(0xFFab825b),
    800: Color(0xFF876748),
    900: Color(0xFF59442f),
  });
}
