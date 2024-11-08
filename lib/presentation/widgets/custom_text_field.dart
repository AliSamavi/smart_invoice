import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String prefixText;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final void Function(String value)? onChanged;

  const CustomTextField({
    required this.controller,
    required this.prefixText,
    this.enabled,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.onEditingComplete,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            prefixText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF757575),
            ),
          ),
          2.widthGap,
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              cursorColor: Colors.blue,
              cursorRadius: const Radius.circular(10),
              enabled: enabled,
              decoration: const InputDecoration(border: InputBorder.none),
              onEditingComplete: onEditingComplete,
              onChanged: onChanged,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
            ),
          ),
        ],
      ),
    );
  }
}
