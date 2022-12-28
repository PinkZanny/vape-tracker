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
  static const accentColor = Color(0xFF456BF6);
  static const borderColor = Color(0xFFD9D9D9);
  static const containerColor = Color(0xFFF9F9F9);
  static const bronzeColor = Color(0xFF456BF6);
  static const silverColor = Color(0xFFEA0FAC);
  static const goldColor = Color(0xFFFFE600);
  static const platinumColor = Color(0xFF05FB1E);
  static const apiKey = 'AIzaSyCvY6gM9RnjejadcDtwOXPyzVovDKicNPA';
}
