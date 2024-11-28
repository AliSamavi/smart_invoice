import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/settings/settings_model.dart';

abstract class SettingsLocal {
  Future<SettingsModel?> getSettings();
  Future<void> editSettings(SettingsModel settings);
}

class SettingsLocalImpl implements SettingsLocal {
  final Box<SettingsModel> _hiveBox;

  SettingsLocalImpl(Box<SettingsModel> hiveBox) : _hiveBox = hiveBox;

  @override
  Future<SettingsModel?> getSettings() async {
    return _hiveBox.values.firstOrNull;
  }

  @override
  Future<void> editSettings(SettingsModel settings) async {
    try {
      await _hiveBox.put(0, settings);
    } catch (e) {
      await _hiveBox.add(settings);
    }
  }
}
