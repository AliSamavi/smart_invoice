import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/settings/settings_model.dart';

abstract class SettingsLocal {
  Future<SettingsModel?> getSettings();
  Future<void> editSettings(SettingsModel settings);
}

class SettingsLocalImpl extends GetxController implements SettingsLocal {
  late Box<SettingsModel> _hiveBox;
  final _completer = Completer<void>();

  @override
  void onInit() async {
    _hiveBox = await Hive.openBox<SettingsModel>("settings");
    _completer.complete();
    super.onInit();
  }

  @override
  Future<SettingsModel?> getSettings() async {
    await _completer.future;
    return _hiveBox.values.firstOrNull;
  }

  @override
  Future<void> editSettings(SettingsModel settings) async {
    await _completer.future;
    try {
      await _hiveBox.put(0, settings);
    } catch (e) {
      await _hiveBox.add(settings);
    }
  }
}
