import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ImageCapsule extends Equatable {
  final Uint8List image;
  ImageCapsule({
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': base64Encode(image),
    };
  }

  factory ImageCapsule.fromMap(Map<String, dynamic> map) {
    return ImageCapsule(
      image: base64Decode(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageCapsule.fromJson(String source) => ImageCapsule.fromMap(json.decode(source) as Map<String, dynamic>);

  ImageCapsule copyWith({
    Uint8List? image,
  }) {
    return ImageCapsule(
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image];
}
