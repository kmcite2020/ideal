// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models/model.dart';

@immutable
class SettingsController {
  final SettingsInterface interface;
  SettingsController({required this.interface});

  late final configDataRM = RM.inject<ConfigData>(
    () => interface.configData,
    sideEffects: SideEffects(
      onSetState: (p0) {
        interface.configData = p0.state;
      },
    ),
  );

  ThemeMode get themeMode => configDataRM.state.themeModeCapsule.themeMode;
  MaterialColor get color => configDataRM.state.colorCapsule.materialColor;
  String get font => configDataRM.state.font;
  double get padding => configDataRM.state.padding;
  double get borderRadius => configDataRM.state.border;
  double get appBarHeight => 80;
  set themeMode(ThemeMode themeMode) =>
      configDataRM.state = configDataRM.state.copyWith(themeModeCapsule: ThemeModeCapsule(themeMode: themeMode));
  set color(MaterialColor color) =>
      configDataRM.state = configDataRM.state.copyWith(colorCapsule: MaterialColorCapsule(materialColor: color));
  set font(Font font) => configDataRM.state = configDataRM.state.copyWith(font: font);
  set padding(double padding) => configDataRM.state = configDataRM.state.copyWith(padding: padding);
  set border(double border) => configDataRM.state = configDataRM.state.copyWith(border: border);
}

final SettingsController settingsBloc = SettingsController(
  interface: SettingsRepository(dataSource: source),
);
