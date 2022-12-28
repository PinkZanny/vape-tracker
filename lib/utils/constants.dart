import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static var KEYS = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];
  static const LinearGradient scaffoldGradient = LinearGradient(colors: [
    Color(0xFFFFFFFF),
    Color(0xFFE1E1E1),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const textColor = Color(0xFF001D48);
  static const secondaryTextColor = Color(0xFF9F9F9F);
  static Color blue = Color(0xFF483CCD);
  static Color green = Color(0xFF04CC7F);
  static Color black = Color(0xFF231F2A);
  static Color gaugeBackground = Color(0xFFE9EFF2);
}
