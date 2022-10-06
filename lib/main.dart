import 'package:flutter/material.dart';
import 'package:practica1/providers/provider.dart';
import 'package:practica1/screens/list_task_screen.dart';
import 'package:practica1/screens/screens.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      //ChangeNotifierProvider(create: (_) => TaskProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      //ChangeNotifierProvider(create: (_) => MoviesProvider()),
    ], child: const _APP());
  }
}

class _APP extends StatelessWidget {
  const _APP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider tema = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: tema.getthemeData(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/dashboard': (BuildContext context) => const DashboardScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        //"/task": (BuildContext context) => const TaskScreen(),
        //"/tasklist": (BuildContext context) => const ListTaskScreen(),
        '/theme': (BuildContext context) => const ThemeScreen(),
        '/list': (BuildContext context) => ListTaskScreen(),
        '/profile': (BuildContext context) => const ProfileScreen(),
        '/onboarding': (BuildContext context) => const OnboardingScreen(),

        //"/movies": (BuildContext context) => const MovieScreen(),
        //"/details": (BuildContext context) => const DetailsScreen(),
      },
    );
  }
}
