part of 'model.dart';

@immutable
class ProductBloc {
  ProductInterface get interface => ProductRepository();

  List<Product> get products => interface.getAllProducts();
  late final addProductForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.always,
    submit: () async => addProduct(product: dummyProduct),
  );

  InjectedFormField<Uint8List> get imageOfProduct => interface.imageOfProduct;
  void addProduct({required Product product}) => interface.addProduct(product: product);
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

  void picker() => interface.picker();

  void changeStock(int stock, Product product) => interface.updateProduct(stock: stock, product: product);

  void changePrice(double i, product) => interface.updateProduct(price: i, product: product);

  void deleteProduct(Product product) => interface.deleteProduct(product);

  String get currentWorth => interface.currentWorth;
}

final ProductBloc productBloc = ProductBloc();
