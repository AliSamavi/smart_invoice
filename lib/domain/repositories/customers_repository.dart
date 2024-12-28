import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/domain/entities/customer.dart';

abstract class CustomersRepository {
  Future<Either<Failure, List<Customer>>> getCustomers();
  Future<Either<Failure, void>> addCustomer(Customer customer);
  Future<Either<Failure, void>> editCustomer(Customer customer);
  Future<Either<Failure, void>> deleteCustomer(Customer customer);
}
