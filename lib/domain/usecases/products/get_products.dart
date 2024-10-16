import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/domain/repositories/products_repository.dart';

class GetProducts {
  final ProductsRepository _repository;

  GetProducts(ProductsRepository repository) : _repository = repository;

  Future<Either<Failure, List<Product>>> call() async {
    return await _repository.getProducts();
  }
}
