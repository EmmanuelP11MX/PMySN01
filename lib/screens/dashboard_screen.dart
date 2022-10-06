import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica1/providers/profile_provider.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    if (profile.userDAO.email == "") {
      profile.cargarUser();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashboardScreen"),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context)
                  .primaryColor //This will change the drawer background to blue.
              //other styles
              ),
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    profile.userDAO.fullName != ""
                        ? profile.userDAO.fullName.toString()
                        : 'nombre de usuario',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(profile.userDAO.email.toString()),
                  currentAccountPicture: Hero(
                    tag: "hero",
                    child: CircleAvatar(
                      backgroundImage: profile.userDAO.image != ""
                          ? Image.file(
                              File("${profile.userDAO.image}"),
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ).image
                          : const NetworkImage(
                              'https://i.pinimg.com/736x/ce/9f/5d/ce9f5dcf5e84a012b34b61ec3e4dbdb3.jpg'),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/57/dd/bb/57ddbb0e894d12a376ae8653edd2092a.png'),
                    fit: BoxFit.cover,
                  )),
                ),
                ListTile(
                  leading: const Icon(Icons.document_scanner_sharp,
                      color: Colors.white),
                  title: const Text(
                    'Practica 1',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(Icons.checklist_rtl_outlined,
                      color: Colors.white),
                  title: const Text('Base de datos',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/tasklist');
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(Icons.checklist_rtl_outlined,
                      color: Colors.white),
                  title: const Text('Temas',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushNamed(context, '/theme');
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text('Cerrar sesion',
                      style: TextStyle(color: Colors.white)),
                  onTap: () async {
                    Preferences.password = "";
                    Preferences.user = "";
                    Preferences.userFull = false;
                    Preferences.showOnboardin = false;
                    profile.borrarUser();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                )
              ],
            ),
          )),
    );
  }
}
