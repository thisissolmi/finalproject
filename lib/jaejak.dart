//제작자들 페이지

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './mypage.dart';

class Jaejak extends StatefulWidget {
  const Jaejak({super.key});

  @override
  State<Jaejak> createState() => _JaejakState();
}

class _JaejakState extends State<Jaejak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0028),
        title: const Text(
          '제작자들',
        ),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: 800,
        height: 700,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/jaejae.png'))),
      ),
    );
  }
}
