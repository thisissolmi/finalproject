import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dariyproject/diarydata.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/main.dart';
import '/fontstyle/fontstyle.dart';
import '/screen/readpage.dart';
import 'package:intl/intl.dart';
import 'dart:html';
import 'package:flutter/material.dart';
//회원가입 1 페이지임

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "회원가입",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              child: Text(
                "이름",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: '이름을 입력해주세요',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
