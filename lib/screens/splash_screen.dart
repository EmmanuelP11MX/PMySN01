import 'package:flutter/material.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/loginp_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:practica1/shared/preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute:
          (Preferences.password.isNotEmpty && Preferences.user.isNotEmpty)
              ? const DashboardScreen()
              : const LoginScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/moon.png",
      text: "MOON",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(fontSize: 30.0, color: Colors.black),
      backgroundColor: Colors.white,
    );
  }
}
