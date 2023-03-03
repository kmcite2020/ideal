// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'customer.dart';

class CustomersCapsule extends Equatable {
  final List<Customer> customers;
  const CustomersCapsule({
    required this.customers,
  });

  CustomersCapsule copyWith({
    List<Customer>? customers,
  }) {
    return CustomersCapsule(
      customers: customers ?? this.customers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customers': customers.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomersCapsule.fromMap(Map<String, dynamic> map) {
    return CustomersCapsule(
      customers: List<Customer>.from(
        (map['customers']).map<Customer>(
          (x) => Customer.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomersCapsule.fromJson(String? source) {
    if (source == null) return init;
    return CustomersCapsule.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [customers];
  static get init => CustomersCapsule(customers: []);
}
