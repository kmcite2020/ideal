import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required final String name,
    required final String city,
    required final String id,
  }) = _Customer;
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  static List<Customer> fromListJson(String source) {
    final List result = json.decode(source) as List;
    return result.map((e) => Customer.fromJson(e)).toList();
  }

  static String toListJson(List<Customer> counters) {
    final List result = counters.map((e) => e.toJson()).toList();
    return json.encode(result);
  }
}
