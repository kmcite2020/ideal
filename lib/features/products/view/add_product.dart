// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/models/model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/utils.dart';
import '../product_controller.dart';
import '../repository.dart';

class AddProduct extends ReactiveStatelessWidget {
  const AddProduct({super.key});

  double get padding => 5;

  double get borderRadius => 15;

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: productController.addProductForm,
      builder: () {
        return Scaffold(
          appBar: AppBar(
            title: Text("SAVE PRODUCT"),
            actions: [
              productController.addProductForm.isValid
                  ? Padding(
                      padding: EdgeInsets.all(padding),
                      child: IconButton(
                        onPressed: () {
                          productController.addProductForm.submit(
                            () async {
                              productController.addProduct(product: dummyProduct);
                            },
                          );
                        },
                        icon: Icon(
                          Icons.save,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: OnFormFieldBuilder(
                  listenTo: productController.imageOfProduct,
                  builder: (value, __) {
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(borderRadius),
                        onTap: () => productController.picker(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: SizedBox(
                            height: 250,
                            child: value == defaultImage
                                ? Image.memory(
                                    defaultImage,
                                    fit: BoxFit.fill,
                                  )
                                : Image.memory(
                                    value,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: TextField(
                  controller: productController.nameOfProduct.controller,
                  focusNode: productController.nameOfProduct.focusNode,
                  decoration: InputDecoration(
                    errorText: productController.nameOfProduct.error,
                    labelText: 'NAME',
                    hintText: 'Enter name here.',
                    suffixIcon: productController.nameOfProduct.hasError
                        ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                        : Icon(Icons.check, color: Theme.of(context).primaryColor),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: TextField(
                  controller: productController.modelOfProduct.controller,
                  focusNode: productController.modelOfProduct.focusNode,
                  decoration: InputDecoration(
                    errorText: productController.modelOfProduct.error,
                    labelText: 'MODEL',
                    hintText: 'Enter model here.',
                    suffixIcon: productController.nameOfProduct.hasError
                        ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                        : Icon(Icons.check, color: Theme.of(context).primaryColor),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    value: productController.brandOfProduct.value,
                    items: Brand.values
                        .map(
                          (eachBrand) => DropdownMenuItem(
                            value: eachBrand,
                            child: Text(eachBrand.description),
                          ),
                        )
                        .toList(),
                    onChanged: productController.brandOfProduct.onChanged,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    value: productController.colorOfProduct.value,
                    items: colors
                        .map(
                          (eachColor) => DropdownMenuItem(
                            value: eachColor,
                            child: Text(eachColor.colorName),
                          ),
                        )
                        .toList(),
                    onChanged: productController.colorOfProduct.onChanged,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: OnFormFieldBuilder(
                  listenTo: productController.priceOfProduct,
                  builder: (_, __) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PRICE MANAGER"),
                            Text(
                              '${productController.priceOfProduct.value.toInt()}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        label: productController.priceOfProduct.value.toInt().toString(),
                        divisions: 12000,
                        min: 0,
                        max: 12000,
                        value: productController.priceOfProduct.value,
                        onChanged: productController.priceOfProduct.onChanged,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: OnFormFieldBuilder(
                  listenTo: productController.stockOfProduct,
                  builder: (value, __) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('STOCK MANAGER'),
                            Text(
                              '${value.toInt()}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        label: value.toString(),
                        divisions: 500,
                        min: 0,
                        max: 500,
                        value: value.toDouble(),
                        onChanged: (_) => productController.stockOfProduct.value = _.floor(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
