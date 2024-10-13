import 'package:get/get.dart';
import 'package:smart_invoice/presentation/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
  }
}
