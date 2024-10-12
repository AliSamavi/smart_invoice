import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetPage;

class Routes {
  static const String main = "/";

  static List<GetPage> get pages => [
        GetPage(
          name: main,
          page: () => const Scaffold(),
        ),
      ];
}
