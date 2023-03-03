// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme_manager.dart';

class MaterialColorX extends Equatable {
  final MaterialColor color;
  const MaterialColorX({
    required this.color,
  });

  MaterialColorX copyWith({
    MaterialColor? color,
  }) {
    return MaterialColorX(
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': ThemeManager.colors.indexOf(color),
    };
  }

  factory MaterialColorX.fromMap(Map<String, dynamic> map) {
    return MaterialColorX(
      color: ThemeManager.colors[map['color']],
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialColorX.fromJson(String source) => MaterialColorX.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [color];
}
