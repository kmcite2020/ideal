// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfigData _$$_ConfigDataFromJson(Map<String, dynamic> json) =>
    _$_ConfigData(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      color: json['color'] == null
          ? Colors.blue
          : const MaterialColorConverter().fromJson(json['color'] as int),
      font: json['font'] as String? ?? 'Dosis',
      padding: (json['padding'] as num?)?.toDouble() ?? 8,
      border: (json['border'] as num?)?.toDouble() ?? 8,
    );

Map<String, dynamic> _$$_ConfigDataToJson(_$_ConfigData instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'color': const MaterialColorConverter().toJson(instance.color),
      'font': instance.font,
      'padding': instance.padding,
      'border': instance.border,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
