// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_import, unused_local_variable, dead_code, no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideal/shared/extensions.dart';
import 'package:ideal/shared/utils.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../customers/customer_bloc.dart';
import '../customers/customer_repository.dart';
import '../customers/view/view.dart';
import '../orders/orders_view.dart';
import '../products/models/model.dart';
import '../products/products_bloc.dart';
import '../products/view/add_product.dart';
import '../products/view/products_view.dart';
import '../settings/view/view.dart';

class GotoDashboardViewButton extends ReactiveStatelessWidget {
  const GotoDashboardViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => RM.navigate.to(DashboardView()),
      icon: const Icon(
        Icons.dashboard,
      ),
    );
  }
}

class DashboardView extends ReactiveStatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GotoSettingsViewButton(),
          GotoProductsViewButton(),
          AddDummyProduct(),
        ],
        title: Text('Dashboard'),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              title: Text('PRODUCTS'),
              trailing: GotoProductsViewButton(),
            ).pad,
            ListTile(
              title: Text(customerLabel),
              trailing: GotoCustomersViewButton(),
            ).pad,
            ListTile(
              title: Text(OrdersView.label),
              trailing: GotoOrdersViewButton(),
            ).pad,
            ListTile(
              title: Text(
                'TOTAL PRODUCTS AVAILABLE',
              ),
              trailing: Text(productsBloc.products.length.toString()),
            ).pad,
            ListTile(
              title: Text(
                'TOTAL CUSTOMERS AVAILABLE',
              ),
              trailing: Text(customerController.customers.length.toString()),
            ).pad,
            ListTile(
              title: Text(
                'TOTAL PRODUCTS SOLD',
              ),
              trailing: Text('20'),
              subtitle: Text('PRODUCTS SOLD ALOT'),
            ).pad,
            ListTile(
              trailing: Text('25'),
              title: Text(
                'TOTAL CUSTOMERS SERVED',
              ),
              subtitle: Text('NO CUSTOMER SATISFIED'),
            ).pad,
            ListTile(
              title: Text('Current Worth'),
              subtitle: Text(
                productsBloc.currentWorth,
                textScaleFactor: 2.5,
              ),
            ).pad,
          ],
        ),
      ),
    );
  }
}
