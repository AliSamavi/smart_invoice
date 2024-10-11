import 'package:flutter/material.dart';

extension IntExtension on int {
  SizedBox get heightGap => SizedBox(height: toDouble());
  SizedBox get widthGap => SizedBox(width: toDouble());
}
