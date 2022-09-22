import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecorations(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 39, 139, 176))),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 39, 144, 176), width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Color.fromARGB(255, 58, 135, 183))
            : null);
  }
}
