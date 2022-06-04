import 'package:flutter/material.dart';
import 'package:job_vacancy/authentication/screens/login_screens.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Code',
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          'assets/c.png',
        ),
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
