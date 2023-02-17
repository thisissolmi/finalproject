import 'package:flutter/material.dart';
import 'package:soda/mypage.dart';
import 'package:soda/write.dart';
import './moa.dart';
import "./splahpage.dart";
import './join.dart';

//import './write.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hello soda',
      theme: ThemeData(
        fontFamily: 'Lotte',
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0028),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mypage(),
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
                            "우리 만난지 400일 째",
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

/*

          
이상한 것 
            SizedBox(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.drive_file_rename_outline_outlined,
                    size: 30, color: Colors.white),
                label: const Text(
                  "교환일기 작성하기",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(25)),
              ),
            ),
            */

            Container(
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
                      builder: (context) => Write(),
                    ),
                  );
                },
                icon: const Icon(Icons.drive_file_rename_outline_outlined,
                    size: 30, color: Colors.white),
                label: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
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

            SizedBox(
              height: 30,
            ),

            Container(
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
                      builder: (context) => Moa(),
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

            // SizedBox(
            //   child: OutlinedButton.icon(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.format_list_bulleted,
            //       size: 30,
            //       color: Colors.white,
            //     ),
            //     // ignore: prefer_const_constructors
            //     label: Text(
            //       "교환일기 모아보기",
            //       style: const TextStyle(
            //         fontSize: 20,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
//여기서부터 추가한 것임
