import 'package:flutter/material.dart';
import './moa.dart';
import 'main.dart';

class Write extends StatelessWidget {
  const Write({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: DiaryListPagePartner(),
    );
  }
}

class DiaryListPagePartner extends StatefulWidget {
  @override
  State<DiaryListPagePartner> createState() => _DiaryListPagePartnerState();
}

class _DiaryListPagePartnerState extends State<DiaryListPagePartner> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff0A0028),
        appBar: AppBar(
          title: const Text('@@@님의 교환일기',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "보내기",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.pink.shade100),
              ),
            )
          ],
          centerTitle: true,
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
          backgroundColor: const Color(0xff0A0028),
        ),
        body: Center(
          child: Column(
            children: const [
              SizedBox(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '제목을 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Divider(
                height: 30,
                color: Colors.white,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "@@@@년 @월 @일 @요일",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                //(패딩대신)크기를 위한 sizedbox입니다.
                height: 331,
                width: 392,
              )
            ],
          ),
        ),
      ),
    );
  }
}
