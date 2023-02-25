// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String name;
  final String city;
  final String id;
  Customer({
    required this.name,
    required this.city,
    required this.id,
  });

  @override
  List<Object> get props => [name, city, id];

  Customer copyWith({
    String? name,
    String? city,
    String? id,
  }) {
    return Customer(
      name: name ?? this.name,
      city: city ?? this.city,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'city': city,
      'id': id,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
      city: map['city'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  // static List<Customer> fromListJson(String? source) {
  //   if (source == null) return <Customer>[];
  //   final List result = json.decode(source) as List;
  //   return result.map((e) => Customer.fromJson(e)).toList();
  // }

  // static String toListJson(List<Customer> counters) {
  //   final List result = counters.map((e) => e.toJson()).toList();
  //   return json.encode(result);
  // }

  @override
  bool get stringify => true;
}
