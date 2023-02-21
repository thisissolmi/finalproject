// import 'package:flutter/material.dart';
// import './main.dart';

// class Page1 extends StatelessWidget {
//   const Page1(this.image, {super.key});

//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0A0028),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 60.0),
//             Image.asset(image),
//           ],
//         ),
//       ),
//     );
//   }
// }

/*

import 'package:flutter/material.dart';
import 'onboarding.dart';
import './onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(builder: (context) =>
            //       const OnBoardingPage()),
            //     );
            //   },
            //   child: const Text('Go to onboarding screen'),
            // ),
          ],
        ),
      ),
    );
  }
}

*/

// import 'package:flutter/material.dart';
// import 'onboarding.dart'; // onboarding.dart import

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: OnBoardingPage(), // onboarding.dart 파일의 OnBoardingPage()를 실행하도록 지정
//     );
//   }
// }

// class MyPage extends StatelessWidget {
//   const MyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Scaffold 위젯을 불러와 AppBar를 만듬
//       appBar: AppBar(
//         // Flutter 2.5 버전부터 한 번 정해지면 바뀌지 않는 데이터를 사용하는 위젯 앞에는 const 키워드를 붙이도록 되어있음
//         title: const Text('Main Page'),
//       ),
//       body: Center(
//         // Center 위젯을 불러와 child로 Column 위젯을 불러옴
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           const Text(
//             'Main Screen',
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           ElevatedButton(
//             // ElevatedButton 위젯 생성
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         const OnBoardingPage()), // MyPage 위젯 리턴
//               );
//             },
//             child: const Text('Go to OnBoarding Screen'),
//           ),
//         ]),
//       ),
//     );
//   }
// }