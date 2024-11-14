import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_invoice/config/routes.dart';
import 'package:smart_invoice/domain/entities/settings.dart';
import 'package:smart_invoice/domain/usecases/settings/edit_settings.dart';
import 'package:smart_invoice/domain/usecases/settings/get_settings.dart';

class SettingsController extends GetxController {
  late GetSettings _getSettings;
  late EditSettings _editSettings;

  SettingsController(
    GetSettings getSettings,
    EditSettings editSettings,
  ) {
    _getSettings = getSettings;
    _editSettings = editSettings;
  }

  late Settings _settings;

  final name = TextEditingController();
  final address = TextEditingController();
  final phoneNum = TextEditingController();
  final postalCode = TextEditingController();
  final economicNum = TextEditingController();
  final registrationNum = TextEditingController();
  final nationalNum = TextEditingController();

  TextEditingController province = TextEditingController();
  TextEditingController city = TextEditingController();

  RxnString signature = RxnString();
  RxnString stamp = RxnString();
  RxnString logo = RxnString();

  bool get authChack => Hive.box("").get(0) == null;

  @override
  void onInit() async {
    final getResult = await _getSettings();
    getResult.fold(
      (failure) => debugPrint(failure.message),
      (settings) {
        _settings = settings;
        name.text = settings.name ?? "";
        address.text = settings.address ?? "";
        phoneNum.text = settings.phoneNum?.toString() ?? "";
        postalCode.text = settings.postalCode?.toString() ?? "";
        economicNum.text = settings.economicNum?.toString() ?? "";
        registrationNum.text = settings.registrationNum?.toString() ?? "";
        nationalNum.text = settings.nationalNum?.toString() ?? "";

        province.text = settings.province ?? "";
        city.text = settings.city ?? "";

        signature(settings.signature);
        stamp(settings.stamp);
      },
    );
    super.onInit();
  }

  @override
  void onClose() async {
    final editResult = await _editSettings.call(
      Settings(
        name: name.text.isEmpty ? _settings.name : name.text,
        province: province.text.isEmpty ? _settings.province : province.text,
        city: city.text.isEmpty ? _settings.city : city.text,
        address: address.text.isEmpty ? _settings.address : address.text,
        phoneNum: phoneNum.text.isEmpty ? _settings.phoneNum : phoneNum.text,
        postalCode:
            postalCode.text.isEmpty ? _settings.postalCode : postalCode.text,
        economicNum:
            economicNum.text.isEmpty ? _settings.economicNum : economicNum.text,
        registrationNum: registrationNum.text.isEmpty
            ? _settings.registrationNum
            : registrationNum.text,
        nationalNum:
            nationalNum.text.isEmpty ? _settings.nationalNum : nationalNum.text,
        signature: signature.value,
        stamp: stamp.value,
      ),
    );
    editResult.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        debugPrint("edited successfully");
      },
    );
    super.onClose();
  }

  void login() {
    List<String> missingFields = [];

    if (name.text.isEmpty) missingFields.add("نام");
    if (province.text.isEmpty) missingFields.add("استان");
    if (city.text.isEmpty) missingFields.add("شهر");
    if (address.text.isEmpty) missingFields.add("آدرس");
    if (phoneNum.text.isEmpty) missingFields.add("شماره تلفن");

    if (missingFields.isEmpty) {
      Get.offAndToNamed(Routes.main);
      Hive.box("").add(true);
    } else {
      Get.snackbar(
        "",
        missingFields.join("، "),
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "لطفا فیلد${missingFields.length > 1 ? "های" : ""} زیر را کامل کنید",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        margin: const EdgeInsets.all(25),
      );
    }
  }
}
