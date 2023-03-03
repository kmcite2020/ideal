// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, unused_import, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_brace_in_string_interps, curly_braces_in_flow_control_structures, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ideal/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/cities.dart';
import '../../../shared/utils.dart';
import '../../settings/models/model.dart';
import '../customer_bloc.dart';
import '../customer_repository.dart';
import '../models/customer.dart';
import 'customer_details_view.dart';

class GotoCustomersViewButton extends StatelessWidget {
  const GotoCustomersViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => RM.navigate.to(CustomersView()),
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}

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
            child: "Add Customer".textScale2,
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
              label: 'Save'.textScale2,
            ),
          )
        ],
      ),
    );
  }
}

class CustomersView extends ReactiveStatelessWidget {
  final isShown = false.inj();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('CUSTOMERS'),
        actions: [
          IconButton(
            tooltip: 'press to enable adding customers',
            icon: Icon(Icons.add_reaction),
            onPressed: () => isShown.toggle(),
          ).pad,
          IconButton(
            tooltip: 'Back to Dashboard',
            onPressed: () => RM.navigate.back(),
            icon: Icon(
              Icons.dashboard,
            ),
          ).pad,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              !isShown.state ? SizedBox() : Card(child: AddCustomerView()),
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
                    // RM.navigate.to(CustomerDetails(value.id));
                  },
                  title: Text(
                    '''${value.name}
${value.id}''',
                  ),
                  subtitle: Text(
                    '${value.city}',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
