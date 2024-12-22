import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/presentation/controllers/products_controller.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';
import 'package:smart_invoice/presentation/widgets/add_product.dart';
import 'package:smart_invoice/presentation/widgets/custom_text_field.dart';
import 'package:smart_invoice/presentation/widgets/delete_dialog.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "محصولات",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Obx(
            () {
              final enabled = controller.products.isNotEmpty;
              return PopupMenuButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                menuPadding: const EdgeInsets.symmetric(vertical: 15),
                onSelected: (value) async {
                  switch (value) {
                    case 0:
                      Get.dialog(AddProduct(onAdd: controller.onAddProduct));
                    case 1:
                      List<List<dynamic>> rows = [];
                      for (Product product in controller.products) {
                        rows.add([
                          product.id,
                          product.name,
                          product.price,
                          product.discount,
                          product.tax
                        ]);
                      }
                      String csvData = const ListToCsvConverter().convert(rows);

                      Directory newDir =
                          Directory("/storage/emulated/0/SmartInvoice");

                      if (!await newDir.exists()) {
                        await newDir.create(recursive: true);
                      }
                      String filePath = "${newDir.path}/Products.csv";

                      final file = File(filePath);
                      await file.writeAsString(csvData);
                    case 2:
                      final shouldDeleted = await Get.dialog<bool>(
                        const DeleteDialog(text: "همه محصولات"),
                      );
                      if (shouldDeleted == true) {
                        for (Product product in controller.products) {
                          controller.onDeleteProduct(product);
                        }
                      }
                  }
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.green.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("ایجاد محصول")
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    enabled: enabled,
                    child: Row(
                      children: [
                        Icon(
                          Icons.output_rounded,
                          color: Colors.green.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("استخراج")
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    enabled: enabled,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          color: Colors.red.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("حذف همه")
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading) {
            return const SizedBox();
          } else if (controller.products.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "محصولی وجود ندارد.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  25.heightGap,
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ["csv"],
                      );
                      if (result == null) {
                        return;
                      }
                      final File file = File(result.files.single.path ?? "");
                      Stream<List> input = file.openRead();

                      Stream<List<String>> lines = input
                          .transform(utf8.decoder)
                          .transform(const LineSplitter())
                          .map((line) => line.split(','));
                      await for (List<String> row in lines) {
                        if (row.length != 5) {
                          break;
                        }
                        controller.onAddProduct(
                          Product(
                            id: int.parse(row[0]),
                            name: row[1],
                            price: int.parse(row[2]),
                            discount: int.parse(row[3]),
                            tax: int.parse(row[4]),
                          ),
                        );
                      }
                      file.delete();
                    },
                    child: const Text(
                      "خواندن از فایل",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 100,
                left: 4,
                right: 4,
              ),
              itemCount: controller.products.length,
              itemBuilder: (_, index) {
                final product = controller.products[index];
                final name = TextEditingController(text: product.name);
                final id = TextEditingController(text: product.id.toString());
                final price =
                    TextEditingController(text: product.price.toString());
                final discount =
                    TextEditingController(text: product.discount.toString());
                final tax = TextEditingController(text: product.tax.toString());

                final idFocus = FocusNode();
                final priceFocus = FocusNode();
                final discountFocus = FocusNode();
                final taxFocus = FocusNode();

                return Obx(
                  () {
                    final enabled = controller.editingProduct == product;

                    return Dismissible(
                      key: Key(product.key.toString()),
                      direction: controller.editingProduct == null
                          ? DismissDirection.startToEnd
                          : DismissDirection.none,
                      onDismissed: (_) async {
                        final index = controller.products.indexOf(product);
                        final deletedProduct = product;
                        controller.products.remove(product);

                        final shouldDeleted = await Get.dialog<bool>(
                          DeleteDialog(text: deletedProduct.name),
                        );
                        if (shouldDeleted == true) {
                          controller.onDeleteProduct(deletedProduct);
                          return;
                        }

                        controller.insertProduct(index, deletedProduct);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(25),
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.delete_rounded,
                          color: Colors.white,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: name,
                                    prefixText: "عنوان:",
                                    enabled: enabled,
                                    onEditingComplete: () =>
                                        idFocus.requestFocus(),
                                  ),
                                ),
                                if (enabled) 6.widthGap,
                                if (enabled)
                                  GestureDetector(
                                    onTap: () {
                                      name.text = product.name;
                                      id.text = product.id.toString();
                                      price.text = product.price.toString();
                                      discount.text =
                                          product.discount.toString();
                                      tax.text = product.tax.toString();
                                      controller.editingProduct = null;
                                    },
                                    child: Container(
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.edit_off_rounded,
                                        color: Color(0xFFF5F5F5),
                                      ),
                                    ),
                                  ),
                                6.widthGap,
                                GestureDetector(
                                  onTap: () {
                                    if (controller.editingProduct == null) {
                                      controller.editingProduct = product;
                                    } else if (enabled) {
                                      if (discount.text == "") {
                                        discount.text = "0";
                                      }
                                      if (tax.text == "") {
                                        tax.text = "0";
                                      }
                                      product.name = name.text;
                                      product.id = int.parse(id.text);
                                      product.price = int.parse(price.text);
                                      product.discount =
                                          int.parse(discount.text);
                                      product.tax = int.parse(tax.text);
                                      controller.onEditProduct(product);
                                      controller.editingProduct = null;
                                    } else {
                                      Get.snackbar(
                                        "",
                                        "",
                                        margin: const EdgeInsets.all(16),
                                        borderRadius: 20,
                                        messageText: 0.heightGap,
                                        titleText: const Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "شما فقط می‌توانید یک محصول را در لحظه ویرایش کنید",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color:
                                          enabled ? Colors.blue : Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      enabled
                                          ? Icons.check_rounded
                                          : Icons.edit_rounded,
                                      color: const Color(0xFFF5F5F5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.heightGap,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: id,
                                    prefixText: "شناسه:",
                                    focusNode: idFocus,
                                    enabled: enabled,
                                    onEditingComplete: () =>
                                        priceFocus.requestFocus(),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                6.widthGap,
                                Expanded(
                                  child: CustomTextField(
                                    controller: price,
                                    prefixText: "قیمت:",
                                    focusNode: priceFocus,
                                    enabled: enabled,
                                    onEditingComplete: () =>
                                        discountFocus.requestFocus(),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            6.heightGap,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: discount,
                                    prefixText: "تخفیف:",
                                    focusNode: discountFocus,
                                    enabled: enabled,
                                    onEditingComplete: () =>
                                        taxFocus.requestFocus(),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                6.widthGap,
                                Expanded(
                                  child: CustomTextField(
                                    controller: tax,
                                    prefixText: "مالیات:",
                                    focusNode: taxFocus,
                                    enabled: enabled,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
