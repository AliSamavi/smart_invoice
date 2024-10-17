import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/product/product_model.dart';

abstract class ProductLocal {
  Future<List<ProductModel>> getProducts();
  Future<int> addProduct(ProductModel product);
  Future<void> editProduct(int key, ProductModel product);
  Future<void> deleteProduct(int key);
}

class ProductLocalImpl extends GetxController implements ProductLocal {
  late Box<ProductModel> _hiveBox;

  @override
  void onInit() async {
    _hiveBox = await Hive.openBox<ProductModel>("products");
    super.onInit();
  }

  @override
  void onClose() async {
    await _hiveBox.close();
    super.onClose();
  }

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
