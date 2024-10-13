import 'package:get/get.dart' show GetPage;
import 'package:smart_invoice/presentation/bindings/main_binding.dart';
import 'package:smart_invoice/presentation/pages/main_page.dart';

class Routes {
  static const String main = "/";

  static List<GetPage> get pages => [
        GetPage(
          name: main,
          page: () => const MainPage(),
          binding: MainBinding(),
        ),
      ];
}
