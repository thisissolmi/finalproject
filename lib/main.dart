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
      home: Splash(), //const MyHomePage(),
    );
  }
}

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
                    height: 350,
                    width: 350,
                    child: Image.asset(
                      'assets/images/sspace.png',
                    ),
                  ),
                ],
              ),
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
