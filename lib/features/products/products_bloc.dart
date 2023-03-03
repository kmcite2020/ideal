import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/models/color_capsule.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../shared/theme_manager.dart';
import '../../shared/utils.dart';
import 'models/image_capsule.dart';
import 'models/model.dart';
import 'models/products_capsule.dart';
import 'repository.dart';

class ProductsBloc {
  ProductRepository repo = ProductRepository(source: source);
  late final productsRM = RM.inject<ProductsCapsule>(
    () => repo.products,
    sideEffects: SideEffects(
      onSetState: (snap) => repo.products = snap.state,
    ),
  );
  List<Product> get products => productsRM.state.products;

  ProductsCapsule get _products => productsRM.state;
  set _products(ProductsCapsule value) => productsRM.state = value;

  late final addProductForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.always,
  );
  void addProduct() {
    final product = Product(
      id: Uuid().v1(),
      name: nameOfProduct.value,
      model: modelOfProduct.value,
      brand: brandOfProduct.value,
      colorCapsule: MaterialColorX(color: colorOfProduct.value),
      price: priceOfProduct.value,
      stock: stockOfProduct.value,
      imageCapsule: ImageCapsule(image: imageOfProduct.value),
    );
    _products = _products.copyWith(products: [...products, product]);
  }

  void deleteProduct(Product product) {
    _products = _products.copyWith(
      products: [
        for (final eachProduct in products)
          if (product != eachProduct) eachProduct
      ],
    );
  }

  final imageOfProduct = RM.injectFormField<Uint8List>(
    defaultImage,
    validators: [
      (image) {
        if (image == defaultImage) {
          return 'please add an image';
        }
        return null;
      }
    ],
  );

  final nameOfProduct = RM.injectTextEditing(
    validators: [
      (text) {
        if (text!.length < 6) {
          return 'should contain at least 6 characters';
        }
        return null;
      }
    ],
  );
  final modelOfProduct = RM.injectTextEditing(
    validators: [
      (text) {
        if (text!.length < 6) {
          return 'should contain at least 6 characters';
        }
        return null;
      }
    ],
  );
  final colorOfProduct = RM.injectFormField<MaterialColor>(ThemeManager.colors.first);
  final brandOfProduct = RM.injectFormField<Brand>(Brand.values.first);
  final priceOfProduct = RM.injectFormField<double>(
    0,
    validators: [
      (value) {
        if (value == 0.0) return 'should have a price';
        return null;
      }
    ],
  );
  final stockOfProduct = RM.injectFormField<int>(0, validators: [
    (value) {
      if (value < 1) return 'should have at least 1 item in stock';
      return null;
    }
  ]);

  Future<void> picker() async {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      dialogTitle: 'Select Image for Product',
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );
    if (files != null) {
      print(files);
      imageOfProduct.value = File(files.files.first.path!).readAsBytesSync();
    }
  }

  void changeStock(int stock, Product product) {
    // productsRM.state = productsRM.state.copyWith(products: []);
  }

  void changePrice(double i, product) {
    // interface.updateProduct(price: i, product: product);
  }

  String get currentWorth {
    // late String worth;
    return (products.fold(0.0, (previousValue, element) => previousValue + (element.stock * element.price))).toString();
    // double temp = 0;
    // for (Product productModel in products) {
    //   temp = temp + productModel.stock * productModel.price;
    // }
    // if (temp <= 1000) {
    //   worth = (temp / 1000).round().toString();
    // } else if (temp > 1000 && temp <= 1000000) {
    //   worth = "${(temp / 1000).toStringAsExponential(3).substring(0, 5)}K";
    // } else if (temp > 1000000 && temp <= 1000000000) {
    //   worth = "${(temp / 1000000).toStringAsExponential(3).substring(0, 5)}M";
    // } else if (temp > 1000000000) {
    //   worth = "${(temp / 1000000000).toStringAsExponential(3).substring(0, 5)}B";
    // }
    // return worth;
  }
}

final ProductsBloc productsBloc = ProductsBloc();
