import 'package:flutter/material.dart';

class Mythemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 232, 238, 242),
      brightness: Brightness.light,
      primaryColor: Colors.white10,
      colorScheme: const ColorScheme.light());

  static final darkTheme = ThemeData(
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.black),
      thumbColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  );
}
