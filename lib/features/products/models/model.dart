// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/models/color_capsule.dart';

import '../../../shared/utils.dart';
import '../repository.dart';
import 'image_capsule.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String model;
  final Brand brand;
  final MaterialColorCapsule colorCapsule;
  final double price;
  final int stock;
  final ImageCapsule imageCapsule;
  const Product({
    required this.id,
    required this.name,
    required this.model,
    required this.brand,
    required this.colorCapsule,
    required this.price,
    required this.stock,
    required this.imageCapsule,
  });
  // static List<Product> fromListJson(String source) {
  //   final List result = json.decode(source);
  //   return result.map((e) => Product.fromJson(e as String)).toList();
  // }

  // static String toListJson(List<Product> products) {
  //   final List result = products.map((e) => e.toJson()).toList();
  //   return json.encode(result);
  // }

  Product updateStock(int stock, Product product) => product = product.copyWith(stock: stock);

  void updatePrice(double price, Product product) {
    product = product.copyWith(price: price);
  }

  Product copyWith({
    String? id,
    String? name,
    String? model,
    Brand? brand,
    MaterialColorCapsule? colorCapsule,
    double? price,
    int? stock,
    ImageCapsule? imageCapsule,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      colorCapsule: colorCapsule ?? this.colorCapsule,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      imageCapsule: imageCapsule ?? this.imageCapsule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'model': model,
      'brand': brand.toMap(),
      'colorCapsule': colorCapsule.toMap(),
      'price': price,
      'stock': stock,
      'imageCapsule': imageCapsule.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      model: map['model'] as String,
      brand: Brand.fromMap(map['brand'] as Map<String, dynamic>),
      colorCapsule: MaterialColorCapsule.fromMap(map['colorCapsule'] as Map<String, dynamic>),
      price: map['price'] as double,
      stock: map['stock'] as int,
      imageCapsule: ImageCapsule.fromMap(map['imageCapsule'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      model,
      brand,
      colorCapsule,
      price,
      stock,
      imageCapsule,
    ];
  }
}

Product get dummyProduct => Product(
      id: 'test-id',
      name: 'test-name',
      model: 'test-model',
      brand: Brand.chinese,
      colorCapsule: MaterialColorCapsule(materialColor: Colors.amber),
      price: 2,
      stock: 20,
      imageCapsule: ImageCapsule(image: defaultImage),
    );
