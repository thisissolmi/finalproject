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
        body: Row( // fl
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: SizedBox(
                  child: Text(
                "총 @개",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
            ),
            // SizedBox(
            //   width: 30,
            //   height: 50,
            // ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SizedBox(
                child: Text("최신순"),
              ),
            ),
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


