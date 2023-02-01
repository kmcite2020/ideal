part of 'model.dart';

@immutable
class SettingsBloc {
  SettingsInterface get interface => settingsInterface;

  ThemeMode get themeMode => interface.themeMode;
  MaterialColor get color => interface.materialColor;
  String get font => interface.font;
  double get padding => interface.padding;
  double get borderRadius => interface.border;
  double get appBarHeight => 80;
  set themeMode(ThemeMode themeMode) => interface.themeMode = themeMode;
  set color(MaterialColor color) => interface.materialColor = color;
  set font(String font) => interface.font = font;
  set padding(double padding) => interface.padding = padding;
  set border(double border) => interface.padding = border;
}

final SettingsBloc settingsBloc = SettingsBloc();
