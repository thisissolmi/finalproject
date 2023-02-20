import 'package:dariyproject/fontstyle.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './main.dart';

//마이페이지 화면 구현. 프로필 화면

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
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {},
            child: const Center(
              child: Text(
                '로그아웃',
                style: fontboldsmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
