// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/utils.dart';

class AddProduct extends ReactiveStatelessWidget {
  const AddProduct({super.key});

  double get padding => 5;

  double get borderRadius => 15;

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: productBloc.addProductForm,
      builder: () {
        return Scaffold(
          appBar: AppBar(
            title: Text("SAVE PRODUCT"),
            actions: [
              productBloc.addProductForm.isValid
                  ? Padding(
                      padding: EdgeInsets.all(padding),
                      child: IconButton(
                        onPressed: () {
                          productBloc.addProductForm.submit(
                            () async {
                              productBloc.addProduct(product: dummyProduct);
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
                  listenTo: productBloc.imageOfProduct,
                  builder: (value, __) {
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(borderRadius),
                        onTap: () => productBloc.picker(),
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
                  controller: productBloc.nameOfProduct.controller,
                  focusNode: productBloc.nameOfProduct.focusNode,
                  decoration: InputDecoration(
                    errorText: productBloc.nameOfProduct.error,
                    labelText: 'NAME',
                    hintText: 'Enter name here.',
                    suffixIcon: productBloc.nameOfProduct.hasError
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
                  controller: productBloc.modelOfProduct.controller,
                  focusNode: productBloc.modelOfProduct.focusNode,
                  decoration: InputDecoration(
                    errorText: productBloc.modelOfProduct.error,
                    labelText: 'MODEL',
                    hintText: 'Enter model here.',
                    suffixIcon: productBloc.nameOfProduct.hasError
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
                    value: productBloc.brandOfProduct.value,
                    items: Brand.values
                        .map(
                          (eachBrand) => DropdownMenuItem(
                            value: eachBrand,
                            child: Text(eachBrand.description),
                          ),
                        )
                        .toList(),
                    onChanged: productBloc.brandOfProduct.onChanged,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    value: productBloc.colorOfProduct.value,
                    items: colors
                        .map(
                          (eachColor) => DropdownMenuItem(
                            value: eachColor,
                            child: Text(eachColor.colorName),
                          ),
                        )
                        .toList(),
                    onChanged: productBloc.colorOfProduct.onChanged,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: OnFormFieldBuilder(
                  listenTo: productBloc.priceOfProduct,
                  builder: (_, __) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PRICE MANAGER"),
                            Text(
                              '${productBloc.priceOfProduct.value.toInt()}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        label: productBloc.priceOfProduct.value.toInt().toString(),
                        divisions: 12000,
                        min: 0,
                        max: 12000,
                        value: productBloc.priceOfProduct.value,
                        onChanged: productBloc.priceOfProduct.onChanged,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(padding),
                child: OnFormFieldBuilder(
                  listenTo: productBloc.stockOfProduct,
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
                        onChanged: (_) => productBloc.stockOfProduct.value = _.floor(),
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
