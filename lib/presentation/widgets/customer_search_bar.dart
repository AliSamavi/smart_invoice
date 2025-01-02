import 'package:flutter/material.dart';
import 'package:smart_invoice/domain/entities/customer.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';

class CustomerSearchBar extends SearchDelegate {
  final List<Customer> customers;
  final void Function(Customer customer) onTap;

  CustomerSearchBar({required this.customers, required this.onTap});

  BuildContext? _context;

  @override
  String? get searchFieldLabel => "جستجو";

  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 18);

  @override
  List<Widget>? buildActions(BuildContext context) {
    _context = context;
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Customer> matchQuery = [];
    for (var customer in customers) {
      if (customer.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(customer);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return _customerWidget(result);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Customer> matchQuery = [];
    for (var customer in customers) {
      if (customer.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(customer);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return _customerWidget(result);
      },
    );
  }

  GestureDetector _customerWidget(Customer customer) {
    return GestureDetector(
      onTap: () {
        onTap(customer);
        close(_context!, null);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "نام: ${customer.name!}",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.heightGap,
            Text(
              "تلفن: ${customer.phoneNum!}",
              overflow: TextOverflow.ellipsis,
            ),
            4.heightGap,
            Text(
              "آدرس: ${customer.city!}، ${customer.address!}",
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
