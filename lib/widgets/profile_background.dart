import 'dart:math';
import 'package:flutter/material.dart';

class ProfileBackground extends StatelessWidget {
  final Widget child;

  const ProfileBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [const _PurpuleBox(), child],
      ),
    );
  }
}

class _PurpuleBox extends StatelessWidget {
  const _PurpuleBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _blueBackground(),
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: 160,
            left: 150,
            child: _Bubble(),
          ),
          Positioned(
            top: -50,
            left: 10,
            child: _Bubble(),
          ),
          Positioned(
            top: -10,
            left: 200,
            child: _Bubble(),
          ),
          Positioned(
            top: 150,
            left: 300,
            child: _Bubble(),
          ),
          Positioned(
            top: 250,
            left: 20,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _blueBackground() {
    return const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 31, 189, 228),
      Color.fromARGB(255, 34, 12, 132),
    ]));
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
