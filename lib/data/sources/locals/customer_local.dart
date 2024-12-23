import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/customer/customer_model.dart';

abstract class CustomerLocal {
  Future<List<CustomerModel>> getCustomers();
  Future<int> addCustomer(CustomerModel customer);
  Future<void> editCustomer(int key, CustomerModel customer);
  Future<void> deleteCustomer(int key);
}

class CustomerLocalImpl extends GetxController implements CustomerLocal {
  late Box<CustomerModel> _hiveBox;
  final _completer = Completer<void>();

  @override
  void onInit() async {
    _hiveBox = await Hive.openBox<CustomerModel>("customers");
    _completer.complete();
    super.onInit();
  }

  @override
  void onClose() async {
    await _hiveBox.close();
    super.onClose();
  }

  @override
  Future<List<CustomerModel>> getCustomers() async {
    await _completer.future;
    return _hiveBox.values.toList();
  }

  @override
  Future<int> addCustomer(CustomerModel customer) async {
    await _completer.future;
    return _hiveBox.add(customer);
  }

  @override
  Future<void> editCustomer(int key, CustomerModel customer) async {
    await _completer.future;
    await _hiveBox.put(key, customer);
  }

  @override
  Future<void> deleteCustomer(int key) async {
    await _completer.future;
    await _hiveBox.delete(key);
  }
}
