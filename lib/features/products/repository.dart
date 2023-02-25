// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'data_source.dart';
import 'models/products_capsule.dart';

abstract class Picker {
  Future<void> picker();
}

abstract class ProductInterface {
  ProductsCapsule get products;
  set products(ProductsCapsule data);
}

class ProductRepository implements ProductInterface, Picker {
  final DataSource dataSource;
  ProductRepository({
    required this.dataSource,
  });
  @override
  ProductsCapsule get products {
    return ProductsCapsule.fromJson(dataSource.load('products'));
  }

  @override
  set products(ProductsCapsule data) {
    dataSource.save('products', data.toJson());
  }

  @override
  String get currentWorth => '';

  @override
  Future<void> picker() {
    // TODO: implement picker
    throw UnimplementedError();
  }
}

// abstract class ProductInterface {
//   InjectedFormField<Uint8List> get imageOfProduct;

//   List<Product> getAllProducts();
//   void addProduct({required Product product});
//   void deleteProduct(Product product);
//   void deleteAllProducts();
//   void updateProduct({
//     String? name,
//     String? model,
//     Brand? brand,
//     MaterialColor? color,
//     double? price,
//     int? stock,
//     Uint8List? image,
//     required Product product,
//   });
// }

enum Brand {
  urideal('URideal'),
  chinese('Chinese'),
  pakistani('Pakistani');

  const Brand(this.description);
  final String description;
  static Brand fromMap(Map<String, dynamic> map) => Brand.values[map['brand']];
  Map<String, dynamic> toMap() => {'brand': Brand.values.indexOf(this)};
}

// class ProductRepository2 implements CurrentWorthInterface, Picker {
//   final DataSource dataSource;
//   final productsRM = RM.inject<List<Product>>(
//     () => [],
//   );

//   ProductRepository2({required this.dataSource});

//   Product updateStock(Product product, int stock) {
//     return product.updateStock(stock, product);
//   }





//   @override
//   void updateProduct({
//     String? name,
//     String? model,
//     Brand? brand,
//     MaterialColor? color,
//     double? price,
//     int? stock,
//     Uint8List? image,
//     required Product product,
//   }) {
//     product = product.copyWith(
//       name: name ?? product.name,
//       model: model ?? product.model,
//       brand: brand ?? product.brand,
//       colorCapsule: MaterialColorCapsule(materialColor: color ?? product.colorCapsule.materialColor),
//       price: price ?? product.price,
//       stock: stock ?? product.stock,
//       imageCapsule: ImageCapsule(image: image ?? product.imageCapsule.image),
//     );
//     productsRM.state = [
//       ...productsRM.state,
//       for (final Product eP in productsRM.state)
//         if (eP.id == product.id) product
//     ];
//   }



//   @override

// }
