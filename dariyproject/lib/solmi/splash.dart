import 'package:flutter/material.dart';
import 'dart:async';
import '/solmi/onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //이게 맞아
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(milliseconds: 5700),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Onboarding() // MyHomePage() // OnBoardingPage(),
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('assets/images/splash.gif'),
      ),
    );
  }
}
