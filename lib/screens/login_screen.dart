import 'package:flutter/material.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:practica1/widgets/widgets.dart';
import 'package:practica1/providers/login_from_provider.dart';
import 'package:practica1/ui/input_decorations.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(children: [
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginFrom()),
              ]),
            ),
            const SizedBox(height: 25),
            const Text(
              'O',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.github,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SocialLoginButton(
                    borderRadius: 10,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _LoginFrom extends StatelessWidget {
  const _LoginFrom({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.black),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Correo electrónico',
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : "Error en el correo";
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
              style: const TextStyle(color: Colors.black),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null) && (value.length >= 8)
                    ? null
                    : 'Minimo 8 caracteres';
              }),
          const SizedBox(
            height: 30,
          ),
          SwitchListTile.adaptive(
              value: loginForm.recordar,
              activeColor: Color.fromARGB(255, 0, 132, 240),
              onChanged: (value) {
                loginForm.recordar = value;
                if (value == true) {
                  Preferences.password = loginForm.password;
                  Preferences.user = loginForm.email;
                } else {
                  Preferences.password = "";
                  Preferences.user = "";
                }
              },
              title: const Text(
                'Recordarme',
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
          const SizedBox(
            height: 15,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Color.fromARGB(148, 158, 158, 158),
              elevation: 0,
              color: Color.fromARGB(255, 0, 131, 197),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      await Future.delayed(const Duration(seconds: 2));
                      loginForm.isLoading = false;
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? "Iniciando..." : 'Iniciar sesión',
                    style: const TextStyle(color: Colors.white),
                  ))),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
