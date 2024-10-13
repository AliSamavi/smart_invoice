import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/presentation/pages/customers_page.dart';
import 'package:smart_invoice/presentation/pages/invoices_page.dart';
import 'package:smart_invoice/presentation/pages/products_page.dart';
import 'package:smart_invoice/presentation/pages/settings_page.dart';

class MainController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  final List<Map<String, dynamic>> _pages = [
    {"page": const InvoicesPage(), "binding": null},
    {"page": const CustomersPage(), "binding": null},
    {"page": const ProductsPage(), "binding": null},
    {"page": const SettingsPage(), "binding": null},
  ];

  int get selectedIndex => _selectedIndex.value;

  Widget get body {
    if (_pages[_selectedIndex.value]["binding"] is Bindings) {
      _pages[_selectedIndex.value]["binding"].dependencies();
    }
    return _pages[_selectedIndex.value]["page"];
  }

  void onSelected(int index) => _selectedIndex(index);
}
