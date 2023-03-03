// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, unused_import, avoid_print, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class GotoOrdersViewButton extends StatelessWidget {
  const GotoOrdersViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => RM.navigate.to(OrdersView()),
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}

class OrdersView extends StatelessWidget {
  static String label = 'ORDERS';
  static Icon icon = Icon(Icons.open_with_rounded);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(0),
          child: IconButton(
            tooltip: 'Back to Dashboard',
            onPressed: () => RM.navigate.back(),
            icon: Icon(
              Icons.dashboard,
            ),
          ),
        ),
        title: Text('Orders'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              tooltip: 'place orders for customer',
              onPressed: () {},
              icon: Icon(Icons.account_box_sharp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [],
        ),
      ),
    );
  }
}
