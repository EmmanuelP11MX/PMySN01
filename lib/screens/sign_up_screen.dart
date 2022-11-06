import 'package:flutter/material.dart';
import 'package:practica1/firebase/email_authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNick = TextEditingController();
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPwd = TextEditingController();
  //EmailAuthentication? _emailAuth;

  @override
  void initState() {
    super.initState();
    //_emailAuth = EmailAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuarios'),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            padding: const EdgeInsets.all(35),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                    GestureDetector(
                      onTap: () {
                        /*_emailAuth!
                            .createUserWithEmailAndPassword(
                                email: txtMail.text, password: txtPwd.text)
                            .then((value) {
                          print(value);
                        });*/
                      },
                      child: const Text(
                        'Guardar Perfil',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Swiss',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                  ),
                ),
                TextFormField(
                  controller: txtMail,
                  decoration: const InputDecoration(
                    hintText: 'Correo',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: txtPwd,
                  decoration: const InputDecoration(
                    hintText: 'Contraseña',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
