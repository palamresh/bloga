import 'package:flutter/material.dart';

class ThemeChangerProvider extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;

  ThemeMode get thememode => _theme;

  void setTheme(thememode) {
    _theme = thememode;
    notifyListeners();
  }
}
