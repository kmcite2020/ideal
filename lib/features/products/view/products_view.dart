// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../settings/models/model.dart';
import '../models/model.dart';
import '../product_controller.dart';
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
              productController.products.isEmpty
                  ? Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "  Product.emptyListInfo",
                        textScaleFactor: 2.5,
                      ),
                    )
                  : SizedBox(),
              for (final Product product in productController.products)
                GestureDetector(
                  onTap: () => productController.deleteProduct(product),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(settingsBloc.padding),
                                child: Text("Name: ${product.name}"),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(settingsBloc.padding),
                                child: Text("Brand: " + product.brand.description),
                              ),
                            ),
                            Card(
                              color: product.colorCapsule.materialColor,
                              child: Padding(
                                padding: EdgeInsets.all(settingsBloc.padding),
                                child: Text(product.colorCapsule.materialColor.colorName),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(settingsBloc.padding),
                                child: Text("Model: ${product.model}"),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(settingsBloc.padding),
                                child: Text("Price: ${product.price.toInt()}"),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(settingsBloc.padding),
                          child: SizedBox(
                            width: size.width,
                            height: size.width / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(settingsBloc.borderRadius),
                              child: Image.memory(
                                product.imageCapsule.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(settingsBloc.padding),
                          child: ElevatedButton(
                            onPressed: () {
                              RM.navigate.to(ProductDetails(product.id));
                            },
                            child: Text(
                              'DETAILS',
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(settingsBloc.padding),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  minHeight: 25,
                                  value: product.stock / 500,
                                ),
                                Align(child: Text("${product.stock}/500", textScaleFactor: 1.2))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
