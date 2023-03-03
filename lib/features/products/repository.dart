// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../shared/data_source.dart';
import 'models/products_capsule.dart';

abstract class Picker {
  Future<void> picker();
}

abstract class ProductInterface {
  ProductsCapsule get products;
  set products(ProductsCapsule data);
}

class ProductRepository {
  final SharedPreferencesDataSource source;
  ProductRepository({required this.source});

  ProductsCapsule get products {
    return ProductsCapsule.fromJson(source.load('products'));
  }

  set products(ProductsCapsule data) {
    source.save('products', data.toJson());
  }
}

enum Brand {
  urideal('URideal'),
  chinese('Chinese'),
  pakistani('Pakistani');

  const Brand(this.description);
  final String description;
  static Brand fromMap(Map<String, dynamic> map) => Brand.values[map['brand']];
  Map<String, dynamic> toMap() => {'brand': Brand.values.indexOf(this)};
}
