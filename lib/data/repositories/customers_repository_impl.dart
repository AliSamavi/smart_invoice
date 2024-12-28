import 'package:dartz/dartz.dart';
import 'package:smart_invoice/config/failures.dart';
import 'package:smart_invoice/data/models/customer/customer_model.dart';
import 'package:smart_invoice/data/sources/locals/customer_local.dart';
import 'package:smart_invoice/domain/entities/customer.dart';
import 'package:smart_invoice/domain/repositories/customers_repository.dart';

class CustomersRepositoryImpl implements CustomersRepository {
  final CustomerLocal _local;

  CustomersRepositoryImpl(CustomerLocal local) : _local = local;

  @override
  Future<Either<Failure, List<Customer>>> getCustomers() async {
    try {
      final customers = await _local.getCustomers();

      return Right(customers.map((customer) {
        return Customer(
          key: customer.key,
          name: customer.name,
          province: customer.province,
          city: customer.city,
          address: customer.address,
          phoneNum: customer.phoneNum,
          postalCode: customer.postalCode,
          economicNum: customer.economicNum,
          registrationNum: customer.registrationNum,
          nationalNum: customer.nationalNum,
          invoicesKey: customer.invoicesKey,
        );
      }).toList());
    } catch (e) {
      return Left(DatabaseFailure("Failed to load customers"));
    }
  }

  @override
  Future<Either<Failure, void>> addCustomer(Customer customer) async {
    try {
      customer.key = await _local.addCustomer(
        CustomerModel(
          name: customer.name,
          province: customer.province,
          city: customer.city,
          address: customer.address,
          phoneNum: customer.phoneNum,
          postalCode: customer.postalCode,
          economicNum: customer.economicNum,
          registrationNum: customer.registrationNum,
          nationalNum: customer.nationalNum,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to add customer"));
    }
  }

  @override
  Future<Either<Failure, void>> editCustomer(Customer customer) async {
    try {
      await _local.editCustomer(
        customer.key!,
        CustomerModel(
          name: customer.name,
          province: customer.province,
          city: customer.city,
          address: customer.address,
          phoneNum: customer.phoneNum,
          postalCode: customer.postalCode,
          economicNum: customer.economicNum,
          registrationNum: customer.registrationNum,
          nationalNum: customer.nationalNum,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to edit customer"));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(Customer customer) async {
    try {
      await _local.deleteCustomer(customer.key!);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure("Failed to delete customer"));
    }
  }
}
