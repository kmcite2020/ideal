import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../shared/cities.dart';
import '../../shared/utils.dart';
import 'customer_repository.dart';
import 'models/customer.dart';
import 'models/customer_capsule.dart';

class CustomerController {
  final CustomerRepository repo;
  CustomerController({
    required this.repo,
  });
  late final customersRM = RM.inject<CustomersCapsule>(
    () => repo.customers,
    sideEffects: SideEffects(
      onSetState: (snap) {
        repo.customers = snap.state;
      },
    ),
  );
  List<Customer> get customers => customersRM.state.customers;
  set _customers(CustomersCapsule value) {
    customersRM.state = value;
  }

  CustomersCapsule get _customers => customersRM.state;

  void addCustomer() {
    // String id = Uuid().v1();
    _customers = _customers.copyWith(
      customers: [
        ...customers,
        Customer(
          id: Uuid().v1(),
          name: name.value,
          city: city.value,
        ),
      ],
    );
  }

  void removeCustomers(String id) {
    _customers = _customers.copyWith(
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
    },
  );

  final city = RM.injectFormField<String>(cities.first);
  final name = RM.injectTextEditing(
    validators: [
      (text) {
        if (text!.length < 1) {
          return 'name should be at least 6 characters long';
        } else {
          return null;
        }
      }
    ],
  );
}

final CustomerController customerController = CustomerController(
  repo: CustomerRepository(dataSource: source),
);
