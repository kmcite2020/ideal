// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleCapsule extends Equatable {
  final Locale locale;
  const LocaleCapsule({
    required this.locale,
  });

  LocaleCapsule copyWith({
    Locale? locale,
  }) {
    return LocaleCapsule(
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locale': locale.languageCode,
    };
  }

  factory LocaleCapsule.fromMap(Map<String, dynamic> map) {
    return LocaleCapsule(
      locale: Locale(map['locale']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocaleCapsule.fromJson(String source) => LocaleCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [locale];
}
