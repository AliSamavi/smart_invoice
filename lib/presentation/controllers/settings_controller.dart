import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
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

  final Rxn<Settings> _settings = Rxn<Settings>();
  Settings? get settings => _settings.value;

  @override
  void onInit() {
    _onGetSettings();
    super.onInit();
  }

  void _onGetSettings() async {
    final getResult = await _getSettings();
    getResult.fold(
      (failure) => debugPrint(failure.message),
      (settings) => _settings(settings),
    );
  }

  void onEditSettings() async {
    final editResult = await _editSettings.call(_settings.value!);
    editResult.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        debugPrint("edited successfully");
      },
    );
  }
}
