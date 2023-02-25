import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model.dart';

class ProductsCapsule extends Equatable {
  final List<Product> products;
  ProductsCapsule({
    required this.products,
  });

  ProductsCapsule copyWith({
    List<Product>? products,
  }) {
    return ProductsCapsule(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductsCapsule.fromMap(Map<String, dynamic> map) {
    return ProductsCapsule(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsCapsule.fromJson(String? source) {
    if (source == null) return ProductsCapsule(products: []);
    return ProductsCapsule.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [products];
}
