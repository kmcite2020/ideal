import 'package:flutter/material.dart';
import 'package:ideal/features/customers/view.dart';
import 'package:ideal/features/dashboard/dashboard.dart';
import 'package:ideal/features/orders/orders_view.dart';
import 'package:ideal/features/products/view/products_view.dart';

import '../../features/products/model.dart';
import '../../features/settings/view/view.dart';
import '../router.dart';

class GotoSettingsViewButton extends StatelessWidget {
  const GotoSettingsViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => router.toPageless(const SettingsView()),
      icon: const Icon(
        Icons.settings,
      ),
    );
  }
}

class GotoDashboardViewButton extends StatelessWidget {
  const GotoDashboardViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => router.toPageless(DashboardView()),
      icon: const Icon(
        Icons.dashboard,
      ),
    );
  }
}

class GotoProductsViewButton extends StatelessWidget {
  const GotoProductsViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => router.toPageless(ProductsView()),
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}

class GotoOrdersViewButton extends StatelessWidget {
  const GotoOrdersViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => router.toPageless(OrdersView()),
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}

class GotoCustomersViewButton extends StatelessWidget {
  const GotoCustomersViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => router.toPageless(CustomersView()),
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}

class AddDummyProduct extends StatelessWidget {
  const AddDummyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        productBloc.addProductForm.submit();
      },
      icon: const Icon(
        Icons.propane_rounded,
      ),
    );
  }
}
