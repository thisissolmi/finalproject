//마이페이지 화면 구현. 프로필 화면
import 'package:flutter/material.dart';
import 'main.dart';
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
      backgroundColor: Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor: Color(0xff0A0028),
        title: const Text(
          '마이페이지',
        ),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text(
                            "닉네임",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        Text("김태희",
                            style: TextStyle(
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
                        children: [
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "제작자들",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 230),
                          IconButton(
                            icon: Icon(
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "로그아웃",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 230,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Mypage(),
                              //   ),
                              // );
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

/*
cColor.fromARGB(255, 148, 89, 89)             "현재 앱 버전",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
             */
/*



import 'package:flutter/material.dart';

class Moa extends StatelessWidget {
  const Moa({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  Color unselectedColor = Color(0xff0A0028);
  MyStatelessWidget({super.key});
  TabBar get _tabBar => TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        //backgroundColor: Colors.white,
        indicator: BoxDecoration(
          color: Color(0xffF6BDE5),
          borderRadius: BorderRadius.circular(200),
        ),
        tabs: const [
          Tab(
            text: "김태희",
          ),
          Tab(text: "송하연"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff0A0028),
        appBar: AppBar(
          title: const Text(
            '교환일기 모아보기',
          ),
          centerTitle: true, // 중앙 정렬
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xff0A0028),
          bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Container(
                width: 315,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: unselectedColor, width: 1),
                    color: unselectedColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffF6BDE5)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _tabBar),
              )),
        ),
        body: Row(
          children: [
            Text("총 @개", style: TextStyle(color: Colors.white, fontSize: 10)),
            Text("최신순", style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
        // //const TabBarView(
        //   children: <Widget>[
        //     Center(
        //       child: Text(
        //         "User 1",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //     Card(
        //       // shape: RoundedRectangleBorder(
        //       //   borderRadius: BorderRadius.circular(16.0),
        //       // ),
        //       elevation: 4.0, //그림자 깊이
        //       child: Icon(
        //         Icons.face,
        //         color: Colors.grey,
        //         size: 200,
        //       ),
        //     ),
        //     Center(
        //       child: Text(
        //         "User 2",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
 */

