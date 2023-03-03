// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/theme_manager.dart';

class ThemeModeCapsule extends Equatable {
  final ThemeMode themeMode;
  const ThemeModeCapsule({
    required this.themeMode,
  });

  ThemeModeCapsule copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeModeCapsule(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': ThemeManager.themeModes.indexOf(themeMode),
    };
  }

  factory ThemeModeCapsule.fromMap(Map<String, dynamic> map) {
    return ThemeModeCapsule(
      themeMode: ThemeMode.values[map['themeMode']],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeModeCapsule.fromJson(String source) => ThemeModeCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [themeMode];
}
