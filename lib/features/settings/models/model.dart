// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/models/color_capsule.dart';
import 'package:ideal/features/settings/models/locale_capsule.dart';
import 'package:ideal/shared/data_source.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/extensions.dart';
import 'theme_mode_capsule.dart';

part '../settings_controller.dart';
part '../settings_repository.dart';

class ConfigData extends Equatable {
  final ThemeModeCapsule themeModeCapsule;
  final MaterialColorX colorCapsule;
  final String font;
  final double padding;
  final double border;
  final LocaleCapsule localeCapsule;
  const ConfigData({
    required this.themeModeCapsule,
    required this.colorCapsule,
    required this.font,
    required this.padding,
    required this.border,
    required this.localeCapsule,
  });

  ConfigData copyWith({
    ThemeModeCapsule? themeModeCapsule,
    MaterialColorX? colorCapsule,
    String? font,
    double? padding,
    double? border,
    LocaleCapsule? localeCapsule,
  }) {
    return ConfigData(
      themeModeCapsule: themeModeCapsule ?? this.themeModeCapsule,
      colorCapsule: colorCapsule ?? this.colorCapsule,
      font: font ?? this.font,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      localeCapsule: localeCapsule ?? this.localeCapsule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeModeCapsule': themeModeCapsule.toMap(),
      'colorCapsule': colorCapsule.toMap(),
      'font': font,
      'padding': padding,
      'border': border,
      'localeCapsule': localeCapsule.toMap(),
    };
  }

  static ConfigData fromMap(Map<String, dynamic> map) {
    return ConfigData(
      themeModeCapsule: ThemeModeCapsule.fromMap(map['themeModeCapsule'] as Map<String, dynamic>),
      colorCapsule: MaterialColorX.fromMap(map['colorCapsule'] as Map<String, dynamic>),
      font: map['font'] as String,
      padding: map['padding'] as double,
      border: map['border'] as double,
      localeCapsule: LocaleCapsule.fromMap(map['localeCapsule'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  static ConfigData fromJson(String? source) {
    if (source != null) {
      return ConfigData.fromMap(json.decode(source));
    } else {
      return ConfigData.init();
    }
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      themeModeCapsule,
      colorCapsule,
      font,
      padding,
      border,
      localeCapsule,
    ];
  }

  static ConfigData init() => ConfigData(
        border: 8,
        padding: 8,
        themeModeCapsule: ThemeModeCapsule(
          themeMode: ThemeMode.system,
        ),
        colorCapsule: MaterialColorX(color: Colors.blue),
        font: 'DM Mono',
        localeCapsule: LocaleCapsule(
          locale: Locale('en'),
        ),
      );
}
