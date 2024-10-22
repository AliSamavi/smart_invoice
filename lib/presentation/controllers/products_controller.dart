import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/domain/usecases/products/add_product.dart';
import 'package:smart_invoice/domain/usecases/products/delete_product.dart';
import 'package:smart_invoice/domain/usecases/products/edit_product.dart';
import 'package:smart_invoice/domain/usecases/products/get_products.dart';

class ProductsController extends GetxController {
  late GetProducts _getProducts;
  late AddProduct _addProduct;
  late EditProduct _editProduct;
  late DeleteProduct _deleteProduct;

  ProductsController(
    GetProducts getProducts,
    AddProduct addProduct,
    EditProduct editProduct,
    DeleteProduct deleteProduct,
  ) {
    _getProducts = getProducts;
    _addProduct = addProduct;
    _editProduct = editProduct;
    _deleteProduct = deleteProduct;
  }

  final Rxn<List<Product>> _products = Rxn<List<Product>>();
  List<Product>? get products => _products.value;

  @override
  void onInit() async {
    _onGetProducts();
    super.onInit();
  }

  void _onGetProducts() async {
    final getResult = await _getProducts();
    getResult.fold(
      (failure) => debugPrint(failure.message),
      (products) => _products(products),
    );
  }

  void onAddProduct(Product product) async {
    final addResult = await _addProduct.call(product);
    addResult.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        _products.value!.add(product);
        debugPrint("added successfully");
      },
    );
  }

  void onEditProduct(Product product) async {
    final editResult = await _editProduct.call(product);
    editResult.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        debugPrint("edited successfully");
      },
    );
  }

  void onDeleteProduct(Product product) async {
    final deleteResult = await _deleteProduct.call(product);
    deleteResult.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        _products.value!.remove(product);
        debugPrint("deleted successfully");
      },
    );
  }
}
