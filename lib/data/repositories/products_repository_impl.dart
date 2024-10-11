import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/data/models/product/product_model.dart';
import 'package:smart_invoice/data/sources/locals/product_local.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductLocal _local;

  ProductsRepositoryImpl(ProductLocal local) : _local = local;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await _local.getProducts();

      return Right(products.map((product) {
        return Product(
            key: product.key,
            id: product.id,
            name: product.name,
            price: product.price);
      }).toList());
    } catch (e) {
      return Left(DatabaseFailure("Failed to load products"));
    }
  }

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    try {
      product.key = await _local.addProduct(
        ProductModel(id: product.id, name: product.name, price: product.price),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to add product"));
    }
  }

  @override
  Future<Either<Failure, void>> editProduct(Product product) async {
    try {
      await _local.editProduct(
        product.key!,
        ProductModel(id: product.id, name: product.name, price: product.price),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to edit product"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(Product product) async {
    try {
      await _local.deleteProduct(product.key!);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to delete product"));
    }
  }
}
