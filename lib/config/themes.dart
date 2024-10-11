import 'package:flutter/material.dart';

class Themes {
  static ThemeData get main {
    TextStyle style = const TextStyle(letterSpacing: 0);
    return ThemeData(
      fontFamily: "IranSans",
      textTheme: ThemeData.light()
          .textTheme
          .apply(fontFamily: "IranSans")
          .copyWith(
              bodyLarge: style,
              bodyMedium: style,
              bodySmall: style,
              displayLarge: style,
              displayMedium: style,
              displaySmall: style,
              headlineLarge: style,
              headlineMedium: style,
              headlineSmall: style,
              labelLarge: style,
              labelMedium: style,
              labelSmall: style,
              titleLarge: style,
              titleMedium: style,
              titleSmall: style),
    );
  }
}
