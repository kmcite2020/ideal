import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../shared/utils.dart';

part 'bloc.dart';
part 'model.freezed.dart';
part 'model.g.dart';
part 'repository.dart';

@freezed
class Product with _$Product {
  const Product._();
  const factory Product({
    required final String id,
    required final String name,
    required final String model,
    required final Brand brand,
    @MaterialColorConverter() required final MaterialColor materialColor,
    required final double price,
    required final int stock,
    @Uint8ListConverter() required final Uint8List image,
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  static List<Product> fromListJson(String source) {
    final List result = json.decode(source);
    return result.map((e) => Product.fromJson(e)).toList();
  }

  static String toListJson(List<Product> products) {
    final List result = products.map((e) => e.toJson()).toList();
    return json.encode(result);
  }

  Product updateStock(int stock, Product product) => product = product.copyWith(stock: stock);

  void updatePrice(double price, Product product) {
    product = product.copyWith(price: price);
  }
}

class MaterialColorConverter implements JsonConverter<MaterialColor, int> {
  const MaterialColorConverter();
  @override
  fromJson(json) => colors[json];

  @override
  toJson(object) => colors.indexOf(object);
}

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) => base64Decode(json);

  @override
  String toJson(Uint8List object) => base64Encode(object);
}

Product get dummyProduct => Product(
      id: 'test-id',
      name: 'test-name',
      model: 'test-model',
      brand: Brand.chinese,
      materialColor: Colors.amber,
      price: 2,
      stock: 20,
      image: defaultImage,
    );
