part of 'model.dart';

SettingsInterface get settingsInterface => SettingsRepository(
      themeModeRM: RM.inject<ThemeMode>(() => ThemeMode.system),
      materialColorRM: RM.inject<MaterialColor>(() => Colors.blue),
      fontRM: RM.inject<Font>(() => "Dosis"),
      paddingRM: RM.inject<double>(() => 10),
      borderRM: RM.inject<double>(() => 20),
    );

class SettingsRepository implements SettingsInterface {
  final Injected<ThemeMode> themeModeRM;
  final Injected<MaterialColor> materialColorRM;
  final Injected<Font> fontRM;
  final Injected<double> paddingRM;
  final Injected<double> borderRM;

  SettingsRepository({
    required this.themeModeRM,
    required this.materialColorRM,
    required this.fontRM,
    required this.paddingRM,
    required this.borderRM,
  });

  @override
  ThemeMode get themeMode => themeModeRM.state;
  @override
  MaterialColor get materialColor => materialColorRM.state;
  @override
  String get font => GoogleFonts.getFont(fontRM.state).fontFamily!;
  @override
  double get padding => paddingRM.state;
  @override
  double get border => borderRM.state;
  double get appBarHeight => 80;

  @override
  set themeMode(themeMode) => themeModeRM.state = themeMode;
  @override
  set materialColor(color) => materialColorRM.state = color;
  @override
  set font(String font) => fontRM.state = font;
  @override
  set padding(padding) => paddingRM.state = padding;
  @override
  set border(border) => borderRM.state = border;
}
