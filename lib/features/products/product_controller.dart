import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ideal/features/products/repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../shared/utils.dart';
import 'models/model.dart';
import 'models/products_capsule.dart';

@immutable
class ProductController {
  ProductRepository get interface => ProductRepository(dataSource: source);
  late final productsRM = RM.inject<ProductsCapsule>(
    () => interface.products,
    sideEffects: SideEffects(
      onSetState: (p0) => interface.products = p0.state,
    ),
  );
  List<Product> get products => productsRM.state.products;
  late final addProductForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.always,
  );
  void addProduct({required Product product}) {
    interface.products = interface.products.copyWith(products: [...products, product]);
  }

  void deleteProduct(Product product) {
    interface.products = interface.products.copyWith(
      products: [
        for (final eachProduct in products)
          if (product != eachProduct) eachProduct
      ],
    );
  }

  InjectedFormField<Uint8List> get imageOfProduct {
    return RM.injectFormField(
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
  }

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
  final colorOfProduct = RM.injectFormField<MaterialColor>(colors.first);
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
  final stockOfProduct = RM.injectFormField<int>(
    0,
    validators: [
      (value) {
        if (value < 1) return 'should have at least 1 item in stock';
        return null;
      }
    ],
  );

  Future<void> picker() async {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
      ],
    );
    if (files != null) {
      imageOfProduct.value = File(files.files.first.path!).readAsBytesSync();
    }
  }

  void changeStock(int stock, Product product) {
    // interface.updateProduct(stock: stock, product: product);
  }

  void changePrice(double i, product) {
    // interface.updateProduct(price: i, product: product);
  }

  String get currentWorth {
    late String worth;
    double temp = 0;
    for (Product productModel in products) {
      temp = temp + productModel.stock * productModel.price;
    }
    if (temp <= 1000) {
      worth = (temp / 1000).round().toString();
    } else if (temp > 1000 && temp <= 1000000) {
      worth = "${(temp / 1000).toStringAsExponential(3).substring(0, 5)}K";
    } else if (temp > 1000000 && temp <= 1000000000) {
      worth = "${(temp / 1000000).toStringAsExponential(3).substring(0, 5)}M";
    } else if (temp > 1000000000) {
      worth = "${(temp / 1000000000).toStringAsExponential(3).substring(0, 5)}B";
    }
    return worth;
  }
}

final ProductController productController = ProductController();
