// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ideal/shared/extensions.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../shared/theme_manager.dart';
import '../products_bloc.dart';
import '../repository.dart';

class AddDummyProduct extends StatelessWidget {
  const AddDummyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'addDummy',
      onPressed: () {
        productsBloc.addProductForm.submit();
      },
      icon: const Icon(
        Icons.add_a_photo_rounded,
      ),
    );
  }
}

class AddProduct extends ReactiveStatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: productsBloc.addProductForm,
      builder: () {
        return Scaffold(
          appBar: AppBar(
            title: Text("SAVE PRODUCT"),
            actions: [
              productsBloc.addProductForm.isValid
                  ? IconButton(
                      onPressed: () {
                        productsBloc.addProductForm.submit(
                          () async {
                            productsBloc.addProduct();
                          },
                        );
                      },
                      icon: Icon(
                        Icons.save,
                      ),
                    ).pad
                  : SizedBox()
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              OnFormFieldBuilder(
                listenTo: productsBloc.imageOfProduct,
                builder: (value, __) {
                  return Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(ThemeManager.borderRadius),
                      onTap: () => productsBloc.picker(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(ThemeManager.borderRadius),
                        child: SizedBox(
                          height: 250,
                          child:
                              //  value == defaultImage
                              //     ?
                              Image.memory(
                            value,
                            fit: BoxFit.fill,
                          )
                          // : Image.memory(
                          //     value,
                          //     fit: BoxFit.fill,
                          //   )
                          ,
                        ),
                      ),
                    ),
                  );
                },
              ).pad,
              TextField(
                controller: productsBloc.nameOfProduct.controller,
                focusNode: productsBloc.nameOfProduct.focusNode,
                decoration: InputDecoration(
                  errorText: productsBloc.nameOfProduct.error,
                  labelText: 'NAME',
                  hintText: 'Enter name here.',
                  suffixIcon: productsBloc.nameOfProduct.hasError
                      ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                      : Icon(Icons.check, color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ).pad,
              TextField(
                controller: productsBloc.modelOfProduct.controller,
                focusNode: productsBloc.modelOfProduct.focusNode,
                decoration: InputDecoration(
                  errorText: productsBloc.modelOfProduct.error,
                  labelText: 'MODEL',
                  hintText: 'Enter model here.',
                  suffixIcon: productsBloc.nameOfProduct.hasError
                      ? Icon(Icons.error, color: Theme.of(context).colorScheme.error)
                      : Icon(Icons.check, color: Theme.of(context).primaryColor),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ).pad,
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  value: productsBloc.brandOfProduct.value,
                  items: Brand.values
                      .map(
                        (eachBrand) => DropdownMenuItem(
                          value: eachBrand,
                          child: Text(eachBrand.description),
                        ),
                      )
                      .toList(),
                  onChanged: productsBloc.brandOfProduct.onChanged,
                ),
              ).pad,
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  value: productsBloc.colorOfProduct.value,
                  items: ThemeManager.colors
                      .map(
                        (eachColor) => DropdownMenuItem(
                          value: eachColor,
                          child: Text(eachColor.colorName),
                        ),
                      )
                      .toList(),
                  onChanged: productsBloc.colorOfProduct.onChanged,
                ),
              ).pad,
              OnFormFieldBuilder(
                listenTo: productsBloc.priceOfProduct,
                builder: (_, __) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PRICE MANAGER"),
                          Text(
                            '${productsBloc.priceOfProduct.value.toInt()}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      label: productsBloc.priceOfProduct.value.toInt().toString(),
                      divisions: 12000,
                      min: 0,
                      max: 12000,
                      value: productsBloc.priceOfProduct.value,
                      onChanged: productsBloc.priceOfProduct.onChanged,
                    ),
                  ],
                ),
              ).pad,
              OnFormFieldBuilder(
                listenTo: productsBloc.stockOfProduct,
                builder: (value, __) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('STOCK MANAGER'),
                        Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ).pad,
                    Slider(
                      label: value.toString(),
                      divisions: 500,
                      min: 0,
                      max: 500,
                      value: value.toDouble(),
                      onChanged: (_) => productsBloc.stockOfProduct.value = _.floor(),
                    ),
                  ],
                ),
              ).pad,
            ],
          ),
        );
      },
    );
  }
}
