import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  double _dimenFont = 1;

  getdimenFont() => this._dimenFont;
  setdimenFont(double value) {
    this._dimenFont = value;
    notifyListeners();
  }

  getthemeData() => this._themeData;
  setthemeData(ThemeData theme) {
    this._themeData = theme;
    notifyListeners();
  }
}
