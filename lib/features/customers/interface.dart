// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../shared/cities.dart';
import 'model.dart';

final Injected<List<Customer>> customers = RM.inject(
  () => [],
  persist: () => PersistState(
    debugPrintOperations: true,
    key: 'customers',
    fromJson: (source) => Customer.fromListJson(source),
    toJson: (state) => Customer.toListJson(state),
    catchPersistError: true,
  ),
);

final addCustomerForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    addCustomer();
    RM.navigate.back();
  },
);

void addCustomer() {
  String id = Uuid().v1();
  customers.state = [
    ...customers.state,
    Customer(
      id: id,
      name: name.value,
      city: city.value,
    ),
  ];
}

void removeCustomers(String id) {
  customers.state = [
    for (final customer in customers.state)
      if (customer.id != id) customer
  ];
}

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
