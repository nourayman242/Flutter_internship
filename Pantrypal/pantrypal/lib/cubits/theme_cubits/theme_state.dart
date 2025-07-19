import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;
  final bool isDarkMode;
  final Color primaryColor;
  final Color cardBackgroundColor;
  final Color textColor;

  ThemeState({
    required this.themeData,
    required this.isDarkMode,
    required this.primaryColor,
    required this.cardBackgroundColor,
    required this.textColor, required Color cardColor,
  });
}
