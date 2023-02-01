import 'package:flutter/material.dart';

abstract class SettingsInterface {
  late ThemeMode themeMode;
  late MaterialColor materialColor;
  late Font font;
  late double padding;
  late double border;
}

typedef Font = String;
