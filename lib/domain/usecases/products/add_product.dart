import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/domain/repositories/products_repository.dart';

class AddProduct {
  final ProductsRepository _repository;

  AddProduct(ProductsRepository repository) : _repository = repository;

  Future<Either<Failure, void>> call(Product product) async {
    return await _repository.addProduct(product);
  }
}
