// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';

class MaterialColorCapsule extends Equatable {
  final MaterialColor materialColor;
  const MaterialColorCapsule({
    required this.materialColor,
  });

  MaterialColorCapsule copyWith({
    MaterialColor? materialColor,
  }) {
    return MaterialColorCapsule(
      materialColor: materialColor ?? this.materialColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialColor': colors.indexOf(materialColor),
    };
  }

  factory MaterialColorCapsule.fromMap(Map<String, dynamic> map) {
    return MaterialColorCapsule(
      materialColor: colors[map['materialColor']],
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialColorCapsule.fromJson(String source) => MaterialColorCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [materialColor];
}
