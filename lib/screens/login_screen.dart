import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtConUser = TextEditingController();
  TextEditingController txtConPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      controller: txtConUser,
      decoration: InputDecoration(
        hintText: 'Usuario',
        label: Text('Correo electronico'),
      ),
      //onChanged: (value) {},
    );

    final txtPwd = TextField(
      controller: txtConPwd,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce la contraseña',
        label: Text('contraseña'),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        height: MediaQuery.of(context)
            .size
            .height, //para que se adapte a la panalla del dispositivo
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/p_login.jpeg'),
            fit: BoxFit
                .cover, //Evita que la pantalla de fondo se redusca al mostrar el teclado
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                'assets/moonknight.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20,
                bottom: MediaQuery.of(context).size.width / 20,
              ),
              color: Colors.grey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  txtUser,
                  SizedBox(
                    height: 15,
                  ),
                  txtPwd,
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 2,
              right: MediaQuery.of(context).size.width / 20,
              child: GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Espere...'),
                      );
                    },
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  //print('Valor de la caja ${txtConUser.text}'); siempre optendremos un string
                  Navigator.pushNamed(
                    context,
                    '/dash',
                  );
                },
                child: Image.asset('assets/moon01.png',
                    height: MediaQuery.of(context).size.width / 5),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 50,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.github,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
