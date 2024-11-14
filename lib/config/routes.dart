import 'package:get/get.dart' show GetPage;
import 'package:smart_invoice/presentation/bindings/main_binding.dart';
import 'package:smart_invoice/presentation/bindings/settings_binding.dart';
import 'package:smart_invoice/presentation/pages/main_page.dart';
import 'package:smart_invoice/presentation/pages/settings_page.dart';

class Routes {
  static const String main = "/";
  static const String settings = "/settings";

  static List<GetPage> get pages => [
        GetPage(
          name: main,
          page: () => const MainPage(),
          binding: MainBinding(),
        ),
        GetPage(
          name: settings,
          page: () => const SettingsPage(),
          binding: SettingsBinding(),
        ),
      ];
}
