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
      body: Center(
          child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              tema.setthemeData(temaDia());
            },
            icon: Icon(Icons.brightness_1),
            label: Text('Tema de Dia'),
          ),
          TextButton.icon(
            onPressed: () {
              tema.setthemeData(temaNoche());
            },
            icon: Icon(Icons.dark_mode),
            label: Text('Tema de Noche'),
          ),
          TextButton.icon(
              onPressed: () {
                tema.setthemeData(temaCalido());
              },
              icon: Icon(Icons.hot_tub_sharp),
              label: Text('Tema Calido'))
        ],
      )),
    );
  }
}
