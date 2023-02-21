import 'package:dariyproject/auth/Info.dart';
import 'package:dariyproject/fontstyle/fontstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './mypage.dart';
import './write.dart';
import './moa.dart';
import 'auth/singuppage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//home 화면
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name = UserProvider.user_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0028),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${UserProvider.user_name.toString()}님",
                    style: homepagecouple,
                  ),
                  const Text(' ❤ '),
                  Text("${UserProvider.partner_name.toString()}님",
                      style: homepagecouple),
                ],
              ),
              const Text(
                '함께 기록한지'
                '\n'
                '400(변수)일째',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 350,
                width: 300,
                child: Image.asset(
                  'assets/images/메인 행성.png',
                ),
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
                        builder: (context) => const Write(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.drive_file_rename_outline_outlined,
                      size: 30, color: Colors.white),
                  label: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      "교환일기 작성하기",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
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
                  label: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      "교환일기 모아보기",
                      style: TextStyle(
                        fontSize: 20,
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
