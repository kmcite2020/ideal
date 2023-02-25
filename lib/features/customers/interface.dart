// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../shared/cities.dart';
import '../products/data_source.dart';
import 'model.dart';

class CustomersCapsule extends Equatable {
  final List<Customer> customers;
  CustomersCapsule({
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
        (map['customers'] as List<int>).map<Customer>(
          (x) => Customer.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomersCapsule.fromJson(String? source) {
    if (source == null) return CustomersCapsule(customers: []);
    print(source);
    return CustomersCapsule.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [customers];
}

abstract class CustomerInterface {
  CustomersCapsule get customers;
  set customers(CustomersCapsule data);

  // void addCustomer(Customer customer);
  // void removeCustomer(String customerID);
}

class CustomerRepository implements CustomerInterface {
  final DataSource dataSource;
  CustomerRepository({
    required this.dataSource,
  });

  @override
  CustomersCapsule get customers => CustomersCapsule.fromJson(dataSource.load('customers'));
  @override
  set customers(CustomersCapsule capsule) => dataSource.save('customers', capsule.toJson());

  // List<Customer> get customers => Customer.fromListJson(dataSource.load('customers'));

  // void addCustomer(Customer customer) => dataSource.save(
  //       'customers',
  //       Customer.toListJson(
  //         [
  //           ...customers,
  //           customer,
  //         ],
  //       ),
  //     );

  // void removeCustomer(String customerID) {
  //   dataSource.save(
  //     'customers',
  //     Customer.toListJson(
  //       [
  // for (final eachCustomer in Customer.fromListJson(dataSource.load('customers')))
  // if (eachCustomer.id != customerID) eachCustomer
  //       ],
  //     ),
  //   );
  // }
}

class CustomerController {
  final CustomerInterface interface;
  CustomerController({
    required this.interface,
  });
  late final customersRM = RM.inject<CustomersCapsule>(
    () => interface.customers,
    sideEffects: SideEffects(
      onSetState: (p0) {
        interface.customers = p0.state;
      },
    ),
  );
  List<Customer> get customers => customersRM.state.customers;
  set customerCap(CustomersCapsule cap) {
    customersRM.state = cap;
  }

  CustomersCapsule get customerCap => customersRM.state;

  void addCustomer() {
    // String id = Uuid().v1();
    customerCap = customerCap.copyWith(customers: [
      ...customers,
      Customer(
        id: Uuid().v1(),
        name: name.value,
        city: city.value,
      ),
    ]);
  }

  void removeCustomers(String id) {
    customerCap = customerCap.copyWith(
      customers: [
        for (final eachCustomer in customers)
          if (eachCustomer.id != id) eachCustomer
      ],
    );
  }

  late final addCustomerForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.always,
    submit: () async {
      addCustomer();
      RM.navigate.back();
    },
  );

  final city = RM.injectFormField<String>(cities.first);
  final name = RM.injectTextEditing(
    validators: [
      (text) {
        if (text!.length < 6) {
          return 'name should be at least 6 characters long';
        } else {
          return null;
        }
      }
    ],
  );
}

final CustomerController customerController = CustomerController(
  interface: CustomerRepository(dataSource: source),
);
