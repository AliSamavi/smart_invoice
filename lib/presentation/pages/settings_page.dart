import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/config/images.dart';
import 'package:smart_invoice/presentation/controllers/settings_controller.dart';
import 'package:smart_invoice/presentation/extensions/int_extension.dart';
import 'package:smart_invoice/presentation/widgets/profile_form.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تنظیمات فاکتور",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: controller.authChack
          ? GestureDetector(
              onTap: controller.login,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
              ),
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          ProfileForm(
            title: "مشخصات فروشنده",
            name: controller.name,
            province: controller.province,
            city: controller.city,
            address: controller.address,
            postalCode: controller.postalCode,
            phoneNum: controller.phoneNum,
            nationalNum: controller.nationalNum,
            economicNum: controller.economicNum,
            registrationNum: controller.registrationNum,
          ),
          4.heightGap,
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Obx(
              () => Row(
                children: [
                  customButton(Images.signature, controller.signature),
                  8.widthGap,
                  customButton(Images.stamp, controller.stamp),
                  8.widthGap,
                  customButton(Images.logo, controller.logo),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded customButton(String defaultImage, RxnString image) {
    return Expanded(
      child: GestureDetector(
        onTap: image.value == null
            ? () async {
                final file =
                    await FilePicker.platform.pickFiles(type: FileType.image);
                if (file == null) {
                  return;
                }
                image(file.paths.first);
              }
            : null,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: image.value == null
                      ? Image.asset(defaultImage, scale: 5.5)
                      : Image.file(File(image.value!), scale: 5.5),
                ),
              ),
              Visibility(
                visible: image.value != null,
                child: IconButton(
                  onPressed: () => image.value = null,
                  color: Colors.red,
                  icon: const Icon(Icons.delete_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
