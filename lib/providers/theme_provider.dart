import 'package:flutter/material.dart';
import 'package:practica1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData = temaDia();

  getthemeData() => _themeData;
  setthemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
