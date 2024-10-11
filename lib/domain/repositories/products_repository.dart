import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, void>> addProduct(Product product);
  Future<Either<Failure, void>> editProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(Product product);
}
