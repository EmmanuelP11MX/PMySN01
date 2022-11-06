import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:practica1/providers/providers.dart';
import 'package:practica1/screens/screens.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      ChangeNotifierProvider(create: (_) => TaskProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => MoviesProvider()),
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
        '/login': (BuildContext context) => const LoginScreen(),
        '/task': (BuildContext context) => const TaskScreen(),
        //'/tasklist': (BuildContext context) => ListTaskScreen(),
        '/theme': (BuildContext context) => const ThemeScreen(),
        //'/list': (BuildContext context) => ListPopularScreen(),
        '/profile': (BuildContext context) => const ProfileScreen(),
        '/onboarding': (BuildContext context) => const OnboardingScreen(),
        '/details': (BuildContext context) => const DetailsScreen(),
        '/movies': (BuildContext context) => const MovieHomeScreen(),
        '/about': (BuildContext context) => AboutUsScreen(),
        '/signup': (BuildContext context) => const SignUpScreen(),
        '/popularMovies': (BuildContext context) => const MovieScreen(),
        '/favoriteMovies': (BuildContext context) =>
            const FavoriteMovieScreen(),
        '/places': (BuildContext context) => const PlacesScreen(),
      },
    );
  }
}
