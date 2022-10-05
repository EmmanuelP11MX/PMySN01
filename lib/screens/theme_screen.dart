import 'package:flutter/material.dart';
import 'package:practica1/providers/theme_provider.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider tema = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema de la interfaz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                print('claro');
                tema.setthemeData(temaDia());
              },
              icon: Icon(Icons.brightness_1),
              label: Text('Tema Claro'),
            ),
            TextButton.icon(
              onPressed: () {
                print('oscuro');
                tema.setthemeData(temaNoche());
              },
              icon: Icon(Icons.dark_mode),
              label: Text('Tema Oscuro'),
            ),
            TextButton.icon(
              onPressed: () {
                print('calido');
                tema.setthemeData(temaCalido());
              },
              icon: Icon(Icons.sunny),
              label: Text('Tema Calido'),
            ),
          ],
        ),
      ),
    );
  }
}
