// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, unused_import, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_brace_in_string_interps, curly_braces_in_flow_control_structures, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../shared/cities.dart';
import '../../shared/utils.dart';
import '../settings/model.dart';
import 'interface.dart';
import 'model.dart';

class CustomerDetails extends StatelessWidget {
  final id;
  CustomerDetails(this.id);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.primaries[color.state],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("CUSTOMER DETAILS"),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

void showAddCustomerForm(context) {
  showDialog(
    context: context,
    builder: (builder) => OnFormBuilder(
      listenTo: addCustomerForm,
      builder: () => SimpleDialog(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Customer.label"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name.controller,
              focusNode: name.focusNode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                errorText: name.error,
                label: Container(
                  decoration: BoxDecoration(
                    color: settingsBloc.color,
                    borderRadius: BorderRadius.circular(settingsBloc.borderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('NAME OF BUYER'),
                  ),
                ),
                suffixIcon: name.hasError
                    ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                    : Icon(Icons.check, color: settingsBloc.color),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OnFormFieldBuilder(
              listenTo: city,
              builder: (value, onChanged) => DropdownButtonFormField(
                  value: value,
                  items: cities
                      .map(
                        (eachValue) => DropdownMenuItem(
                          value: eachValue,
                          child: Text(eachValue),
                        ),
                      )
                      .toList(),
                  onChanged: onChanged),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              onPressed: addCustomerForm.isValid ? () => addCustomerForm.submit() : null,
              icon: Icon(
                Icons.save,
              ),
              label: Text('Save'),
            ),
          )
        ],
      ),
    ),
  );
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
              onPressed: () => showAddCustomerForm(context),
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
                customers.state.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          emptyListInfoCustomer,
                          textScaleFactor: 2.3,
                        ),
                      )
                    : SizedBox(),
                for (final Customer value in customers.state)
                  ListTile(
                    onLongPress: () {
                      removeCustomers(value.id);
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
