import 'package:flutter/material.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/list_task_screen.dart';
import 'package:practica1/screens/loginp_screen.dart';
import 'package:practica1/screens/splash_screen.dart';
import 'package:practica1/screens/task_screen.dart';
import 'package:practica1/shared/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //bool rsecion;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //MaterialApp es el primer widget del arbol de widgets.
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/dashboard': (BuildContext context) => const DashboardScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/task': (BuildContext context) => ListTaskScreen(),
        '/add': (BuildContext context) => TaskScreen(),
      }, //MyHome es la primer pantalla que se va visualizar
    );
  }
}
