/*
// import 'main.dart';
import 'package:flutter/material.dart';
import 'package:neeww/main.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'dart:async'; //Timer

void main() {
  runApp(const Homepage());
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //이게 맞아 
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      ),
    );
    super.initState();
  }
  /////////TEST ////////////

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3));
  //   () => Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Homepage(),
  //         ),
  //       );
  // }
//   @override
// void initState() { 
// //set timer for splash screen
// Timer(const Duration(seconds: 4), () async {
// //add your logic here 
//  Navigator.pushNamedAndRemoveUntil(
//         context, ScreenRoute.mainScreen, (route) => false);
// super.initState();
// };

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


///////TEST /////////
// GifController controller= GifController(vsync: this);


//      GifImage(
//           controller: controller,
//           image: AssetImage("images/animate.gif"),
//      )

*/