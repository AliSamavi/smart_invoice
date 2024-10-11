import 'package:flutter/material.dart';
import 'package:smart_invoice/config/localization.dart';
import 'package:smart_invoice/config/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.main,
      supportedLocales: Localization.locales,
      localizationsDelegates: Localization.delegates,
      home: const Scaffold(
        body: Center(
          child: Text("سلام جهان!"),
        ),
      ),
    );
  }
}
