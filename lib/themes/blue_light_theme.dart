import 'package:flutter/material.dart';

class BlueLightTheme {
  BlueLightTheme._();

  static const Color verdigris = Color(0xFF34A0A4);
  static const Color bondiBlue = Color(0xFF168AAD);
  static const Color auburn = Color(0xFFA43834);
  static const Color white = Color(0xFFFAFDFC);
  static const Color richBlack = Color(0xFF040F14);

  static ThemeData get light {
    return ThemeData(
        colorScheme: const ColorScheme.light(
          primary: verdigris,
          onPrimary: white,
          secondary: auburn,
          onSecondary: richBlack,
          tertiary: bondiBlue,
          onTertiary: white,
          background: white,
          onBackground: richBlack,
          tertiaryContainer: white,
          onTertiaryContainer: richBlack,
          surface: white,
          surfaceTint: white,
          onSurface: richBlack,
          shadow: richBlack,
        ),
        useMaterial3: true);
  }

  static ThemeData get dark {
    return ThemeData(
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: verdigris,
          onPrimary: white,
          secondary: auburn,
          onSecondary: richBlack,
          background: richBlack,
          onBackground: white,
          tertiaryContainer: richBlack,
          onTertiaryContainer: white,
          surface: richBlack,
          surfaceTint: richBlack,
          onSurface: white,
          shadow: white,
        ),
        useMaterial3: true);
  }
}
