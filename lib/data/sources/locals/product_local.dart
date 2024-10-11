import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/product/product_model.dart';

abstract class ProductLocal {
  Future<List<ProductModel>> getProducts();
  Future<int> addProduct(ProductModel product);
  Future<void> editProduct(int key, ProductModel product);
  Future<void> deleteProduct(int key);
}

class ProductLocalImpl implements ProductLocal {
  final Box<ProductModel> _hiveBox;

  ProductLocalImpl(Box<ProductModel> hiveBox) : _hiveBox = hiveBox;

  @override
  Future<List<ProductModel>> getProducts() async {
    return _hiveBox.values.toList();
  }

  @override
  Future<int> addProduct(ProductModel product) async {
    return _hiveBox.add(product);
  }

  @override
  Future<void> editProduct(int key, ProductModel product) async {
    await _hiveBox.put(key, product);
  }

  @override
  Future<void> deleteProduct(int key) async {
    await _hiveBox.delete(key);
  }
}
