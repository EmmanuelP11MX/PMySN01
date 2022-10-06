import 'package:flutter/material.dart';
import 'package:practica1/providers/provider.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:practica1/shared/preferences.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider tema = Provider.of<ThemeProvider>(context);

    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //const SizedBox(height: 14),
                        Image.asset(
                          'assets/onboard01.png',
                          fit: BoxFit.cover,
                          width: 250,
                        ),
                        const SizedBox(height: 80),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            'Películas, Tareas y más',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            'Bienvenido a esta aplicación desarrollada para la materia de programación móvil donde estamos aprendiendo todo lo posible de flutter.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    )),
                Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: const Text(
                            '🔧 Aplicación en construcción ⚙️',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Image.asset(
                          'assets/onboard02.png',
                          fit: BoxFit.cover,
                          width: 440,
                        ),
                        const SizedBox(height: 14),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: const Text(
                            'Actualmente estamos desarrollando el catálogo de películas.',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    )),
                Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: const Text(
                            'Por el momento puedes seleccionar un tema 🖌️',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          'assets/onboard03.png',
                          fit: BoxFit.cover,
                          width: 300,
                        ),
                        const SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                print('dia');
                                tema.setthemeData(temaDia());
                              },
                              icon: Icon(Icons.brightness_1),
                              label: Text('Tema Claro'),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                print('noche');
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
                      ],
                    )),
              ]),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                onPressed: () {
                  Preferences.showOnboardin = false;
                  Navigator.pushNamed(context, '/dashboard');
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: const Text('Get Satarted'),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Theme.of(context).primaryColor,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        'SKIP',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                            spacing: 16,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.white),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                      child: const Text('NEXT',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ],
                ),
              ));
  }
}

class _Sider extends StatelessWidget {
  const _Sider({
    Key? key,
    required this.titel,
    required this.content,
    this.image,
    required this.color,
    this.buttons,
  }) : super(key: key);
  final String titel;
  final String content;
  final String? image;
  final Color? color;
  final Widget? buttons;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titel),
          ],
        ));
  }
}
