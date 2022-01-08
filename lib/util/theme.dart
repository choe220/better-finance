import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// Orange - F0B67F
// Red - FE5F55
// Teal - D6D1B1
// Green - 81A480
// Light Green - EEF5DB

ThemeData theme = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  primarySwatch: CustomColors.orange,
  scaffoldBackgroundColor: CustomColors.green,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColors.lightGreen,
    type: BottomNavigationBarType.fixed,
    unselectedIconTheme: IconThemeData(
      opacity: 0.4,
      color: Colors.black,
    ),
    selectedIconTheme: IconThemeData(
      opacity: 1,
      color: CustomColors.orange,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 10,
    selectedItemColor: CustomColors.orange,
  ),
);

ThemeData themeTwo = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    unselectedIconTheme: IconThemeData(
      opacity: 0.25,
    ),
    selectedIconTheme: IconThemeData(
      opacity: 1,
    ),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 10,
    selectedItemColor: Colors.orange,
  ),
);

class CustomColors {
  CustomColors._();

  static const _orangePrimaryValue = 0xFFF0B67F;
  static const _greenPrimaryValue = 0xFF81A480;
  static const _lightGreenPrimaryValue = 0xFFEEF5DB;
  static const _tealPrimaryValue = 0xFFD6D1B1;
  static const _redPrimaryValue = 0xFFFE5F55;

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

  static const MaterialColor green =
      MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color(0xFFDBF6DB),
    100: Color(0xFFCBE9CE),
    200: Color(0xFFBBE1C2),
    300: Color(0xFFA6CBB0),
    400: Color(0xFF99BD9D),
    500: Color(_greenPrimaryValue),
    600: Color(0xFF668E61),
    700: Color(0xFF527D54),
    800: Color(0xFF3A6139),
    900: Color(0xFF1B4023),
  });

  static const MaterialColor lightGreen =
      MaterialColor(_lightGreenPrimaryValue, <int, Color>{
    500: Color(_lightGreenPrimaryValue),
    600: Color(0xFFD2D9BF),
    700: Color(0xFFB4BBA1),
    800: Color(0xFF989F85),
    900: Color(0xFF838A70),
  });

  static const MaterialColor teal =
      MaterialColor(_tealPrimaryValue, <int, Color>{
    50: Color(0xFFFFFCDC),
    100: Color(0xFFFAF5D5),
    200: Color(0xFFF4EFCF),
    300: Color(0xFFEBE6C6),
    400: Color(0xFFE4DFBF),
    500: Color(_tealPrimaryValue),
    600: Color(0xFFC6C1A1),
    700: Color(0xFFBAB595),
    800: Color(0xFFA9A484),
    900: Color(0xFF948F6F),
  });

  static const MaterialColor red = MaterialColor(_redPrimaryValue, <int, Color>{
    500: Color(_redPrimaryValue),
    600: Color(0xFFEC4D43),
    700: Color(0xFFDC3D33),
    800: Color(0xFFCC2D23),
    900: Color(0xFFB3140A),
  });
}
