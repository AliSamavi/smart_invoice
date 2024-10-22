import 'package:get/get.dart';
import 'package:smart_invoice/data/repositories/products_repository_impl.dart';
import 'package:smart_invoice/data/sources/locals/product_local.dart';
import 'package:smart_invoice/domain/repositories/products_repository.dart';
import 'package:smart_invoice/domain/usecases/products/add_product.dart';
import 'package:smart_invoice/domain/usecases/products/delete_product.dart';
import 'package:smart_invoice/domain/usecases/products/edit_product.dart';
import 'package:smart_invoice/domain/usecases/products/get_products.dart';
import 'package:smart_invoice/presentation/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<ProductLocal>(ProductLocalImpl());

    Get.lazyPut<ProductsRepository>(
      () => ProductsRepositoryImpl(Get.find<ProductLocal>()),
      fenix: true,
    );

    Get.lazyPut<GetProducts>(
      () => GetProducts(Get.find<ProductsRepository>()),
      fenix: true,
    );
    Get.lazyPut<AddProduct>(
      () => AddProduct(Get.find<ProductsRepository>()),
      fenix: true,
    );
    Get.lazyPut<EditProduct>(
      () => EditProduct(Get.find<ProductsRepository>()),
      fenix: true,
    );
    Get.lazyPut<DeleteProduct>(
      () => DeleteProduct(Get.find<ProductsRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => ProductsController(
        Get.find<GetProducts>(),
        Get.find<AddProduct>(),
        Get.find<EditProduct>(),
        Get.find<DeleteProduct>(),
      ),
      fenix: true,
    );
  }
}
