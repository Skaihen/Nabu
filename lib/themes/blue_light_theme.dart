import 'package:flutter/material.dart';

import 'custom_ui.dart';

class BlueLightTheme {
  BlueLightTheme._();

  static const Color jade = Color(0xFF00B267);
  static const Color bondiBlue = Color(0xFF168AAD);
  static const Color auburn = Color(0xFFA43834);
  static const Color azureWeb = Color(0xFFFFFFFF);
  static const Color jetBlack = Color(0xFF2C2C2C);

  static ThemeData get light {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
            primary: Colors.lightBlue,
            onPrimary: azureWeb,
            secondary: auburn,
            onSecondary: jetBlack,
            tertiary: bondiBlue,
            onTertiary: azureWeb,
            background: azureWeb,
            onBackground: jetBlack,
            tertiaryContainer: azureWeb,
            onTertiaryContainer: jetBlack,
            surface: azureWeb,
            surfaceTint: azureWeb,
            onSurface: jetBlack,
            shadow: Colors.blue),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
          ),
          actionsPadding: EdgeInsets.all(CustomUI.xSize(3)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomUI.xSize(1),
              ),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomUI.xSize(1),
              ),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              )),
        ));
  }

  static ThemeData get dark {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Colors.lightBlue,
          onPrimary: azureWeb,
          secondary: auburn,
          onSecondary: jetBlack,
          background: jetBlack,
          onBackground: azureWeb,
          tertiaryContainer: jetBlack,
          onTertiaryContainer: azureWeb,
          surface: jetBlack,
          surfaceTint: jetBlack,
          onSurface: azureWeb,
          shadow: Colors.blue,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CustomUI.xSize(1)),
          ),
          actionsPadding: EdgeInsets.all(CustomUI.xSize(3)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomUI.xSize(1),
              ),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                CustomUI.xSize(1),
              ),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              )),
        ));
  }
}
