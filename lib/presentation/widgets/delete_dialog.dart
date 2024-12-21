import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDialog extends StatelessWidget {
  final String text;
  const DeleteDialog({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تأیید حذف"),
      content: Text.rich(
        TextSpan(
          text: "آیا مطمئن هستید که می‌خواهید ",
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const TextSpan(
              text: " را حذف کنید؟",
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          style: const ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            "لغو",
            style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          style: const ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            "حذف",
            style: TextStyle(
              color: Colors.red.shade800,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
