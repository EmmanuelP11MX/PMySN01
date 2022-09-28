import 'package:flutter/material.dart';

ThemeData temaDia() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(primaryColor: Colors.red);
}

ThemeData temaNoche() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(primaryColor: Colors.red);
}

ThemeData temaCalido() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(primaryColor: Color.fromARGB(255, 231, 146, 26));
}
