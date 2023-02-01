part of 'model.dart';

abstract class ProductInterface {
  InjectedFormField<Uint8List> get imageOfProduct;

  List<Product> getAllProducts();
  void addProduct({required Product product});
  void deleteProduct(Product product);
  void deleteAllProducts();
  void updateProduct({
    String? name,
    String? model,
    Brand? brand,
    MaterialColor? color,
    double? price,
    int? stock,
    Uint8List? image,
    required Product product,
  });
  String get currentWorth;
  Future<void> picker();
}

enum Brand {
  urideal('URideal'),
  chinese('Chinese'),
  pakistani('Pakistani');

  const Brand(this.description);
  final String description;
}

class ProductRepository implements ProductInterface {
  final productsRM = RM.inject<List<Product>>(
    () => [],
    persist: () => PersistState(
      throttleDelay: 200,
      key: 'products',
      fromJson: (source) => Product.fromListJson(source),
      toJson: (state) => Product.toListJson(state),
    ),
  );

  Product updateStock(Product product, int stock) {
    return product.updateStock(stock, product);
  }

  @override
  InjectedFormField<Uint8List> get imageOfProduct => RM.injectFormField(
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

  @override
  List<Product> getAllProducts() => productsRM.state;
  // set products(value) => productsRM.state = value;
  @override
  void deleteProduct(Product product) {
    productsRM.state = [
      for (final eproduct in productsRM.state)
        if (eproduct != product) eproduct
    ];
  }

  @override
  void addProduct({required Product product}) {
    productsRM.state = [...productsRM.state, product];
  }

  @override
  void deleteAllProducts() => productsRM.state = [];

  @override
  void updateProduct({
    String? name,
    String? model,
    Brand? brand,
    MaterialColor? color,
    double? price,
    int? stock,
    Uint8List? image,
    required Product product,
  }) {
    product = product.copyWith(
      name: name ?? product.name,
      model: model ?? product.model,
      brand: brand ?? product.brand,
      materialColor: color ?? product.materialColor,
      price: price ?? product.price,
      stock: stock ?? product.stock,
      image: image ?? product.image,
    );
    productsRM.state = [
      ...productsRM.state,
      for (final Product eP in productsRM.state)
        if (eP.id == product.id) product
    ];
  }

  @override
  String get currentWorth {
    late String worth;
    double temp = 0;
    for (Product productModel in productsRM.state) {
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

  @override
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
}
