import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecorations(
      {
      // required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 185, 0, 121))),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 185, 0, 121), width: 2)),
        // hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Color.fromARGB(255, 12, 51, 228))
            : null);
  }
}
