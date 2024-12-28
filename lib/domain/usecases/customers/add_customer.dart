import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/customer.dart';
import 'package:smart_invoice/domain/repositories/customers_repository.dart';

class AddCustomer {
  final CustomersRepository _repository;

  AddCustomer(CustomersRepository repository) : _repository = repository;

  Future<Either<Failure, void>> call(Customer customer) async {
    return await _repository.addCustomer(customer);
  }
}
