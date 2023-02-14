//마이페이지 화면 구현. 프로필 화면
import 'package:flutter/material.dart';
import 'package:soda/mypage.dart';
import 'package:soda/write.dart';
import './moa.dart';
import 'main.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0028),
        title: const Text(
          '마이페이지',
        ),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: 'Flutter Demo Home Page')),
            );
          },
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              //decoration: ,
              child: Text(
                "dddd",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
