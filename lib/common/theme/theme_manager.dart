import 'package:flutter/material.dart';

class ThemeManager {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  ThemeMode toggleTheme({required String selectedTheme}) {
    switch (selectedTheme) {
      case "light":
        _themeMode = ThemeMode.light;
        break;

      case "dark":
        _themeMode = ThemeMode.dark;
        break;

      case "system":
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
        break;
    }
    return _themeMode;
  }
}
