import 'dart:developer';

import 'package:dariyproject/auth/Info.dart';
import 'package:dariyproject/fontstyle/fontstyle.dart';
import 'package:dariyproject/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';
import 'jaejak.dart';
import '../auth/singuppage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 0, 16),
              child: Container(
                height: 102,
                width: 343,
                decoration: //color: Color(0xffF693D7
                    BoxDecoration(
                  border: Border.all(color: const Color(0xffF693D7)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff0A0028),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text(
                            "닉네임",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Text("${UserProvider.user_name}",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            20,
                            0,
                            20,
                            0,
                          ),
                          child: Text(
                            "가입일",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Text(
                          "2023년 2월 14일 ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 5),
              child: Column(
                children: [
                  SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(31, 0, 0, 0),
                            child: Text(
                              "현재 앱 버전",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            "0.0.1",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(31, 0, 0, 0),
                            child: Text(
                              "제작자들",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 230),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Jaejak(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const Loginpagepart())));
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(31, 0, 0, 0),
                                child: Text(
                                  '로그아웃',
                                  style: mypagefont,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 230,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Loginpagepart(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Getpartnertextfield extends StatefulWidget {
  const Getpartnertextfield({super.key});

  @override
  State<Getpartnertextfield> createState() => _GetpartnertextfieldState();
}

class _GetpartnertextfieldState extends State<Getpartnertextfield> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllername.dispose();
    controllerEmail.dispose();
  }

  void _tryValidation() {
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            key: const ValueKey(1),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                hintText: 'ex)파트너 Nickname이름',
                hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
            validator: ((value) {
              if (value!.isEmpty || value.length > 2) {
                return '최소 3자 이상 적어주세요';
              }
              return null;
            }),
            onChanged: (value) {
              controllername.text = value;
            },
            onSaved: (value) {
              controllername.text = value!;
            },
          ),
          TextField(
            controller: controllername,
          ),
          TextFormField(
            key: const ValueKey(2),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
                hintText: 'ex)파트너 Nickname이름',
                hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
            validator: ((value) {
              if (value!.isEmpty || value.length > 2) {
                return '최소 3자 이상 적어주세요';
              }
              return null;
            }),
            onChanged: (value) {
              controllername.text = value;
            },
            onSaved: (value) {
              controllername.text = value!;
            },
          ),
          TextField(
            controller: controllername,
          ),
          GestureDetector(
              onTap: () async {
                _tryValidation();
                final userInfo = FirebaseFirestore.instance
                    .collection('user')
                    .where('user_email', isEqualTo: controllerEmail.text)
                    .snapshots();
                final isEmpty = await userInfo.isEmpty;
                if (isEmpty) return;
                final partneruserID =
                    (await userInfo.first).docs.first.data()['user_email'];
                log(partneruserID);
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'partner_email': partneruserID});
                UserProvider.partner_email = partneruserID;

                final userInfo2 = FirebaseFirestore.instance
                    .collection('user')
                    .where('user_name', isEqualTo: controllername)
                    .snapshots();
                final isEmpty2 = await userInfo2.isEmpty;
                if (isEmpty2) return;
                final partnerusername =
                    (await userInfo.first).docs.first.data()['user_name'];
                log(partnerusername);
                UserProvider.partner_name = partnerusername;
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'partner_name': partnerusername});

                // ignore_for_file: use_build_context_synchronously
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => const Homepage())),
                    (route) => false);
              },
              child: Container(
                width: 100,
                height: 50,
                color: const Color(0xffF6BDE5),
                child: const Center(
                  child: Text(
                    '완료',
                    style: loginpageloginblack,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
