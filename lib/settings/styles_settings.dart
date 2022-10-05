import 'package:flutter/material.dart';

ThemeData temaDia() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(primaryColor: Color.fromARGB(255, 50, 198, 247));
}

ThemeData temaNoche() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(primaryColor: Color.fromARGB(255, 10, 0, 199));
}

ThemeData temaCalido() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(primaryColor: Color.fromARGB(255, 219, 115, 11));
}
