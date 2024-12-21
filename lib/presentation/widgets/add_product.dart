import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/domain/entities/product.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';
import 'package:smart_invoice/presentation/widgets/custom_text_field.dart';

class AddProduct extends StatelessWidget {
  final void Function(Product) onAdd;
  AddProduct({required this.onAdd, super.key});

  final _name = TextEditingController();
  final _id = TextEditingController();
  final _price = TextEditingController();
  final _discount = TextEditingController(text: "0");
  final _tax = TextEditingController(text: "0");

  final _idFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _discountFocus = FocusNode();
  final _taxFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: _name,
              prefixText: "عنوان:",
              onEditingComplete: () => _idFocus.requestFocus(),
            ),
            10.heightGap,
            CustomTextField(
              controller: _id,
              prefixText: "شناسه:",
              focusNode: _idFocus,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onEditingComplete: () => _priceFocus.requestFocus(),
            ),
            10.heightGap,
            CustomTextField(
              controller: _price,
              prefixText: "قیمت:",
              focusNode: _priceFocus,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onEditingComplete: () => _discountFocus.requestFocus(),
            ),
            10.heightGap,
            CustomTextField(
              controller: _discount,
              prefixText: "تخفیف:",
              focusNode: _discountFocus,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onEditingComplete: () => _taxFocus.requestFocus(),
            ),
            10.heightGap,
            CustomTextField(
              controller: _tax,
              prefixText: "مالیات:",
              focusNode: _taxFocus,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            25.heightGap,
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("ذخیره"),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    if (_name.text.isEmpty ||
        _id.text.isEmpty ||
        _price.text.isEmpty ||
        _discount.text.isEmpty ||
        _tax.text.isEmpty) {
      return;
    }
    onAdd(Product(
        id: int.parse(_id.text),
        name: _name.text,
        price: int.parse(_price.text),
        discount: int.parse(_discount.text),
        tax: int.parse(_tax.text)));
    Get.back();
  }
}
