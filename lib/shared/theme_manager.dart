import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/settings/models/model.dart';
import 'extensions.dart';

class ThemeManager {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: color,
      scaffoldBackgroundColor: color[100],
      cardTheme: CardTheme(color: color[300]),
      useMaterial3: true,
      fontFamily: GoogleFonts.getFont(font).fontFamily,
      appBarTheme: AppBarTheme(
        color: color[200],
        toolbarHeight: appBarHeight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: color[800],
          backgroundColor: color[200],
          minimumSize: buttonSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: color[200],
        border: OutlineInputBorder(),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: color[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: color,
      scaffoldBackgroundColor: color[900],
      cardTheme: CardTheme(color: color[700]),
      useMaterial3: true,
      fontFamily: GoogleFonts.getFont(font).fontFamily,
      appBarTheme: AppBarTheme(
        color: color[800],
        toolbarHeight: appBarHeight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: color[200],
            backgroundColor: color[800],
            minimumSize: buttonSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: color[800],
        border: OutlineInputBorder(),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: color[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    );
  }

  /// magic
  static Size get buttonSize => Size.fromHeight(80);
  static ThemeMode get themeMode => settingsBloc.themeMode;
  static double get appBarHeight => 80;
  static MaterialColor get color => settingsBloc.color;
  static Font get font => settingsBloc.font;
  static double get borderRadius => settingsBloc.borderRadius;

  /// separate
  static List<MaterialColor> get colors => Colors.primaries;
  static List<ThemeMode> get themeModes => ThemeMode.values;
  static List<String> get fonts {
    return [
      "Azeret Mono",
      "Comfortaa",
      "DM Mono",
      "Dosis",
      "Fira Sans",
      "IBM Plex Mono",
      "Josefin Sans",
      "Montserrat",
      "Space Mono",
      "Ubuntu",
    ];
  }
}
