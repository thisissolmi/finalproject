import 'package:flutter/material.dart';
import 'package:neeww/splahpage.dart';
import 'mypage.dart';
import 'write.dart';
import 'moa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_gifimage/flutter_gifimage.dart';
import './splahpage.dart';
// import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import './page1.dart';
import './onboarding.dart';
import 'package:introduction_screen/introduction_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lotte',
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // theme: ThemeData(
      //   // useMaterial3: true,
      //   primarySwatch: Colors.blue,
      // ),
      home: const Splash(),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(), // onboarding.dart 파일의 OnBoardingPage()를 실행하도록 지정
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold 위젯을 불러와 AppBar를 만듬
      appBar: AppBar(
        // Flutter 2.5 버전부터 한 번 정해지면 바뀌지 않는 데이터를 사용하는 위젯 앞에는 const 키워드를 붙이도록 되어있음
        title: const Text('Main Page'),
      ),
      body: Center(
        // Center 위젯을 불러와 child로 Column 위젯을 불러옴
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Main Screen',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            // ElevatedButton 위젯 생성
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        const OnBoardingPage()), // MyPage 위젯 리턴
              );
            },
            child: const Text('Go to OnBoarding Screen'),
          ),
        ]),
      ),
    );
  }
}

*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      appBar: AppBar(
        automaticallyImplyLeading: false, // 홈화면 (앱바) 에서 뒤로가기 없애는 것임. 
        backgroundColor: const Color(0xff0A0028),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 27,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Mypage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '김태희',
                        style: TextStyle(
                          fontFamily: 'Lotte',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/heart.png'),
                      ),
                      const Text(
                        '송하연',
                        style: TextStyle(
                          fontFamily: 'Lotte',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "우리 만난지 100일 째",
                            style: TextStyle(
                              fontFamily: 'Lotte',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 330, //원래는 350이야 둘 다
                    width: 330,
                    child: Image.asset(
                      'assets/images/sspace.png',
                    ),
                  ),
                ],
              ),
            ),

            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30) //모서리
                    ),
                side: const BorderSide(width: 2.0, color: Color(0xffF6BDE5)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Write(),
                  ),
                );
              },
              icon: const Icon(Icons.drive_file_rename_outline_outlined,
                  size: 30, color: Colors.white),
              label: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "교환일기 작성하기",
                  style: TextStyle(
                    fontFamily: 'Lotte',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Container(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30) //모서리
                      ),
                  side: const BorderSide(width: 2.0, color: Color(0xffF6BDE5)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Moa(),
                    ),
                  );
                },
                icon: const Icon(Icons.format_list_bulleted,
                    size: 30, color: Colors.white),
                label: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "교환일기 모아보기",
                    style: TextStyle(
                      fontFamily: 'Lotte',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '김태희',
                          style: TextStyle(
                            fontFamily: 'Lotte',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/heart.png'),
                        ),
                        const Text(
                          '송하연',
                          style: TextStyle(
                            fontFamily: 'Lotte',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "우리 만난지 100일 째",
                              style: TextStyle(
                                fontFamily: 'Lotte',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        'assets/images/sspace.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30) //모서리
                        ),
                    side: BorderSide(width: 2.0, color: Color(0xffF6BDE5)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Write(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.drive_file_rename_outline_outlined,
                      size: 30, color: Colors.white),
                  label: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "교환일기 작성하기",
                      style: TextStyle(
                        fontFamily: 'Lotte',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 2.0, color: Color(0xffF6BDE5)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.5))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Moa(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.format_list_bulleted,
                      size: 30, color: Colors.white),
                  label: Padding(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "교환일기 모아보기",
                      style: TextStyle(
                        fontFamily: 'Lotte',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
