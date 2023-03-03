// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ideal/features/customers/view/delete_all_customers_view.dart';
import 'package:ideal/features/settings/view/fonts_view.dart';
import 'package:ideal/features/settings/view/theme_modes_view.dart';
import 'package:ideal/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../products/view/delete_all_products_view.dart';
import 'colors_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Settings'.text,
        actions: const [
          BackButton(),
        ],
      ),
      body: ListView(
        children: [
          DeleteAllCustomersView(),
          DeleteAllProductsView(),
          ThemeModesView(),
          ColorsView(),
          FontsView(),
        ],
      ),
    );
  }
}

class GotoSettingsViewButton extends StatelessWidget {
  const GotoSettingsViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => RM.navigate.to(const SettingsView()),
      icon: const Icon(
        Icons.settings,
      ),
    );
  }
}
