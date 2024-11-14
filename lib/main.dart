import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_invoice/config/localization.dart';
import 'package:smart_invoice/config/routes.dart';
import 'package:smart_invoice/config/themes.dart';
import 'package:smart_invoice/data/models/product/product_model.dart';
import 'package:smart_invoice/data/models/settings/settings_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(SettingsModelAdapter());
  await Hive.openBox("");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.main,
      locale: Localization.locale,
      localizationsDelegates: Localization.delegates,
      getPages: Routes.pages,
      initialRoute: Hive.box("").get(0) == null ? Routes.settings : Routes.main,
    );
  }
}
