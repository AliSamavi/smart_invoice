import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:smart_invoice/data/models/settings/settings_model.dart';
import 'package:smart_invoice/data/repositories/settings_repository_impl.dart';
import 'package:smart_invoice/data/sources/locals/settings_local.dart';
import 'package:smart_invoice/domain/repositories/settings_repository.dart';
import 'package:smart_invoice/domain/usecases/settings/edit_settings.dart';
import 'package:smart_invoice/domain/usecases/settings/get_settings.dart';
import 'package:smart_invoice/presentation/controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingsLocal>(
        SettingsLocalImpl(Hive.box<SettingsModel>("settings")));

    Get.lazyPut<SettingsRepository>(
      () => SettingsRepositoryImpl(Get.find<SettingsLocal>()),
      fenix: true,
    );

    Get.lazyPut<GetSettings>(
      () => GetSettings(Get.find<SettingsRepository>()),
      fenix: true,
    );
    Get.lazyPut<EditSettings>(
      () => EditSettings(Get.find<SettingsRepository>()),
      fenix: true,
    );

    Get.lazyPut(
      () => SettingsController(
        Get.find<GetSettings>(),
        Get.find<EditSettings>(),
      ),
      fenix: true,
    );
  }
}
