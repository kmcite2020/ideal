// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/extensions.dart';
import 'package:ideal/shared/theme_manager.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../settings/models/model.dart';
import '../models/model.dart';
import '../products_bloc.dart';
import 'add_product.dart';
import 'product_details.dart';

class ProductsView extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        title: Text('PRODUCTS'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                RM.navigate.to(AddProduct());
                // pop(context);
              },
              icon: Icon(Icons.add_shopping_cart),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              productsBloc.products.isEmpty ? PRODUCT_EMPTY_LIST_MESSAGE.text : SizedBox(),
              for (final Product product in productsBloc.products)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      tileColor: product.colorCapsule.color,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          product.name.text.clipRadius,
                          product.brand.text,
                          product.colorCapsule.color.colorName.text,
                          product.model.text,
                          product.price.floor().textScale2,
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          RM.navigate.to(ProductDetails(product.id));
                        },
                        icon: Icon(Icons.info),
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            height: size.width / 2,
                            child: Image.memory(
                              product.imageCapsule.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  ThemeManager.borderRadius,
                                ),
                                child: LinearProgressIndicator(
                                  minHeight: 40,
                                  value: product.stock / 500,
                                ),
                              ),
                              Center(child: "${product.stock}/500".textScale2)
                            ],
                          ).pad
                        ],
                      ),
                    ).pad.clipRadius.pad,
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class GotoProductsViewButton extends StatelessWidget {
  const GotoProductsViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'toProducts',
      onPressed: () => RM.navigate.to(ProductsView()),
      icon: const Icon(
        Icons.perm_phone_msg,
      ),
    );
  }
}
