// import 'main.dart';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:neeww/main.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'dart:async';

import 'package:neeww/onboarding.dart'; //Timer

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
    super.initState();

    Timer(
      const Duration(milliseconds: 5700),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingPage(),
          ),
        );
      },
    );

    // Timer(
    //   const Duration(seconds: 5),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const Homepage(),
    //     ),
    //   ),
    // );
//     super.initState();
//     super.initState();

// Timer? timer,

// @override

    // timer = Timer(
    //   const Duration(seconds: 3),
    //   () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const MyHomePage(),
    //         ),
    //         );
    //   }
    // );
    //}
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



// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);
//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   Timer? _timer;
//   AppPreferences _appPreferences = instance<AppPreferences>();
//   _startDelay() {
//     _timer = Timer(Duration(seconds: 2), MyHomePage);
//   }

//   MyHomePage() async {
//     _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
//           if (isUserLoggedIn)
//             {
//               // navigate to main screen
//               Navigator.pushReplacementNamed(context, Routes.mainRoute)
//             }
//           else
//             {
//               _appPreferences
//                   .isOnBoardingScreenViewed()
//                   .then((isOnBoardingScreenViewed) => {
//                         if (isOnBoardingScreenViewed)
//                           {
//                             Navigator.pushReplacementNamed(
//                                 context, Routes.loginRoute)
//                           }
//                         else
//                           {
//                             Navigator.pushReplacementNamed(
//                                 context, Routes.onBoardingRoute)
//                           }
//                       })
//             }
//         });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startDelay();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0A0028),
//       body: Center(
//         child: Image.asset('assets/images/splash.gif'),
//       ),
//     );
//   }
// }
