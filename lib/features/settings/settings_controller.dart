// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models/model.dart';

@immutable
class SettingsController {
  final SettingsInterface repo;
  SettingsController({required this.repo});

  late final configDataRM = RM.inject<ConfigData>(
    () => repo.configData,
    sideEffects: SideEffects(
      onSetState: (snap) {
        repo.configData = snap.state;
      },
    ),
  );

  ThemeMode get themeMode => configDataRM.state.themeModeCapsule.themeMode;
  MaterialColor get color => configDataRM.state.colorCapsule.color;
  String get font => configDataRM.state.font;
  double get padding => configDataRM.state.padding;
  double get borderRadius => configDataRM.state.border;

  set themeMode(ThemeMode themeMode) => configDataRM.state = configDataRM.state.copyWith(
        themeModeCapsule: ThemeModeCapsule(themeMode: themeMode),
      );
  set color(MaterialColor color) => configDataRM.state = configDataRM.state.copyWith(
        colorCapsule: MaterialColorX(color: color),
      );
  set font(Font font) => configDataRM.state = configDataRM.state.copyWith(
        font: font,
      );
  set padding(double padding) => configDataRM.state = configDataRM.state.copyWith(
        padding: padding,
      );
  set border(double border) => configDataRM.state = configDataRM.state.copyWith(
        border: border,
      );
}

final SettingsController settingsBloc = SettingsController(
  repo: SettingsRepository(dataSource: source),
);
