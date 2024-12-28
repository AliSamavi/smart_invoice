import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/customer.dart';
import 'package:smart_invoice/domain/repositories/customers_repository.dart';

class GetCustomers {
  final CustomersRepository _repository;

  GetCustomers(CustomersRepository repository) : _repository = repository;

  Future<Either<Failure, List<Customer>>> call() async {
    return await _repository.getCustomers();
  }
}
