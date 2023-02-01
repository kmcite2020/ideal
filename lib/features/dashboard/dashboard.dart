// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_import, unused_local_variable, dead_code, no_leading_underscores_for_local_identifiers

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideal/shared/go_to/buttons.dart';
import 'package:ideal/shared/utils.dart';
import '../customers/interface.dart';
import '../customers/view.dart';
import '../orders/orders_view.dart';
import '../products/model.dart';
import '../products/view/products_view.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [GotoSettingsViewButton(), GotoProductsViewButton(), AddDummyProduct()],
        title: Text('Dashboard'),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Card(child: ListTile(title: Text('PRODUCTS'), trailing: GotoProductsViewButton())),
            Card(
              child: ListTile(
                title: Text(customerLabel),
                trailing: GotoCustomersViewButton(),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(OrdersView.label),
                trailing: GotoOrdersViewButton(),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'TOTAL PRODUCTS AVAILABLE',
                ),
                trailing: Text(productBloc.products.length.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'TOTAL CUSTOMERS AVAILABLE',
                ),
                trailing: Text(customers.state.length.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'TOTAL PRODUCTS SOLD',
                ),
                trailing: Text('20'),
                subtitle: Text('PRODUCTS SOLD ALOT'),
              ),
            ),
            Card(
              child: ListTile(
                trailing: Text('25'),
                title: Text(
                  'TOTAL CUSTOMERS SERVED',
                ),
                subtitle: Text('NO CUSTOMER SATISFIED'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Current Worth'),
                subtitle: Text(
                  productBloc.currentWorth,
                  textScaleFactor: 2.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
