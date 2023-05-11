import 'package:flutter/material.dart';

class BlueLightTheme {
  BlueLightTheme._();

  static const Color jade = Color(0xFF00B267);
  static const Color bondiBlue = Color(0xFF168AAD);
  static const Color auburn = Color(0xFFA43834);
  static const Color azureWeb = Color(0xFFFFFFFF);
  static const Color richBlack = Color(0xFF2C2C2C);

  static ThemeData get light {
    return ThemeData(
        colorScheme: const ColorScheme.light(
          primary: jade,
          onPrimary: azureWeb,
          secondary: auburn,
          onSecondary: richBlack,
          tertiary: bondiBlue,
          onTertiary: azureWeb,
          background: azureWeb,
          onBackground: richBlack,
          tertiaryContainer: azureWeb,
          onTertiaryContainer: richBlack,
          surface: azureWeb,
          surfaceTint: azureWeb,
          onSurface: richBlack,
          shadow: richBlack,
        ),
        useMaterial3: true);
  }

  static ThemeData get dark {
    return ThemeData(
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: jade,
          onPrimary: azureWeb,
          secondary: auburn,
          onSecondary: richBlack,
          background: richBlack,
          onBackground: azureWeb,
          tertiaryContainer: richBlack,
          onTertiaryContainer: azureWeb,
          surface: richBlack,
          surfaceTint: richBlack,
          onSurface: azureWeb,
          shadow: azureWeb,
        ),
        useMaterial3: true);
  }
}
