import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_invoice/presentation/controllers/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          backgroundColor: Colors.grey.withOpacity(0.05),
          overlayColor: const WidgetStatePropertyAll(Color(0xAABBDEFB)),
          indicatorColor: const Color(0xFFBBDEFB),
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: controller.onSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_rounded),
              label: "فاکتور‌ها",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_3_rounded),
              label: "مشتریان",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_rounded),
              label: "محصولات",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_rounded),
              label: "تنظیمات",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.body),
    );
  }
}
