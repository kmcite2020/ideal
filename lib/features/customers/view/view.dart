// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, unused_import, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_brace_in_string_interps, curly_braces_in_flow_control_structures, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/cities.dart';
import '../../../shared/utils.dart';
import '../../settings/models/model.dart';
import '../interface.dart';
import '../model.dart';
import 'customer_details_view.dart';

class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: customerController.addCustomerForm,
      builder: () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Customer.label"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: customerController.name.controller,
              focusNode: customerController.name.focusNode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                errorText: customerController.name.error,
                label: 'name'.text,
                suffixIcon: customerController.name.hasError
                    ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                    : Icon(Icons.check, color: settingsBloc.color),
              ),
            ),
          ),
          OnFormFieldBuilder(
            listenTo: customerController.city,
            builder: (value, onChanged) => DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  label: 'city'.text,
                ),
                value: value,
                items: cities
                    .map(
                      (eachValue) => DropdownMenuItem(
                        value: eachValue,
                        child: Text(eachValue),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ).pad,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: customerController.addCustomerForm.isValid ? () => customerController.addCustomerForm.submit() : null,
              icon: Icon(
                Icons.save,
              ),
              label: Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}

class CustomersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(settingsBloc.padding),
          child: IconButton(
            tooltip: 'Back to Dashboard',
            onPressed: () => RM.navigate.back(),
            icon: Icon(
              Icons.dashboard,
            ),
          ),
        ),
        title: Text('CUSTOMERS'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.add_reaction),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AddCustomerView(),
                customerController.customers.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          emptyListInfoCustomer,
                          textScaleFactor: 2.3,
                        ),
                      )
                    : SizedBox(),
                for (final Customer value in customerController.customers)
                  ListTile(
                    onLongPress: () {
                      customerController.removeCustomers(value.id);
                    },
                    onTap: () {
                      RM.navigate.to(CustomerDetails(value.id));
                    },
                    title: Text(
                      '${value.name}'.toUpperCase(),
                    ),
                    subtitle: Text(
                      '${value.city}'.toUpperCase(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
