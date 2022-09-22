import 'package:flutter/material.dart';
import 'package:practica1/shared/preferences.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashboardScreen"),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 74, 74, 74),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Emmanuel Ponce Ramírez',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text((Preferences.user.isNotEmpty)
                  ? Preferences.user
                  : "emmanuelpr@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/ce/9f/5d/ce9f5dcf5e84a012b34b61ec3e4dbdb3.jpg'),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/57/dd/bb/57ddbb0e894d12a376ae8653edd2092a.png'),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_go_rounded),
              title: const Text('Practica 1'),
              onTap: () {},
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: const Icon(Icons.all_inbox_rounded),
              trailing: Icon(Icons.chevron_right),
              title: Text('Base de datos'),
              onTap: () {
                Navigator.pushNamed(context, '/task');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesion'),
              onTap: () {
                Preferences.password = "";
                Preferences.user = "";
                Navigator.pushReplacementNamed(context, '/login');
              },
              trailing: const Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}
