import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
