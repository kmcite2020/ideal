import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ideal/features/products/model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'interface.dart';

part 'bloc.dart';
part 'model.freezed.dart';
part 'model.g.dart';
part 'repository.dart';

@freezed
class ConfigData with _$ConfigData {
  const factory ConfigData({
    @Default(ThemeMode.system) final ThemeMode themeMode,
    @Default(Colors.blue) @MaterialColorConverter() final MaterialColor color,
    @Default('Dosis') final String font,
    @Default(8) final double padding,
    @Default(8) final double border,
  }) = _ConfigData;
  factory ConfigData.fromJson(Map<String, dynamic> json) => _$ConfigDataFromJson(json);
}
