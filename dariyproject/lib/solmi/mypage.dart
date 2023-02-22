//마이페이지 화면 구현. 프로필 화면
// import 'dart:js';

import 'package:flutter/material.dart';
import '/main.dart';
import './jaejak.dart';
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
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 25, 20, 20),
                          child: Text(
                            "닉네임",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 25, 20, 20),
                          child: Text("김태희",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            30,
                            0,
                            20,
                            0,
                          ),
                          child: Text(
                            "가입일",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                          child: Text(
                            "2023년 2월 14일 ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
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
                          Text(
                            "현재 앱 버전",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
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
                          const Text(
                            "제작자들",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
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
                                  builder: (context) => const Jaejak(),
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
                          const Text(
                            "로그아웃",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 230,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext) {
                                    return AlertDialog(
                                      // elevation: 100,
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      title: Center(
                                        child: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 5),
                                              child: Text('로그아웃'),
                                            ),
                                            Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        ),
                                      ),
                                      content: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(35, 0, 0, 0),
                                        child: Text('로그아웃 하시겠습니까? '),
                                      ),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24))),
                                      actions: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(const Mypage());
                                          },
                                          child: Text('취소', style: TextStyle()),
                                          style: OutlinedButton.styleFrom(
                                              fixedSize: Size(120, 40),
                                              foregroundColor:
                                                  Color(0xff8C8F93),
                                              side: BorderSide(
                                                color: Color(0xff8C8F93),
                                                width: 1.0,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  21.5)))),
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('로그아웃'),
                                            style: OutlinedButton.styleFrom(
                                                fixedSize: Size(120, 40),
                                                foregroundColor:
                                                    Color(0xFFD66ED1),
                                                side: BorderSide(
                                                  color: Color(0xFFD66ED1),
                                                  width: 1.0,
                                                ),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    21.5))))),
                                      ],
                                    );
                                  });
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
