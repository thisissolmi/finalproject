// import 'package:flutter/material.dart';

// class Write extends StatelessWidget {
//   const Write({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   Color unselectedColor = Color(0xff0A0028);
//   MyStatelessWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';

class Write extends StatelessWidget {
  const Write({super.key});

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
  // Color unselectedColor = Color(0xff0A0028);
  // MyStatelessWidget({super.key});
  // TabBar get _tabBar => TabBar(
  //       labelColor: Colors.black,
  //       unselectedLabelColor: Colors.grey,
  //       //backgroundColor: Colors.white,
  //       indicator: BoxDecoration(
  //         color: Color(0xffF6BDE5),
  //         borderRadius: BorderRadius.circular(200),
  //       ),
  //       tabs: const [
  //         Tab(
  //           text: "김태희",
  //         ),
  //         Tab(text: "송하연"),
  //       ],
  // );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff0A0028),
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
            // TextButton(
            //   text "보내기",
            //   // style: Colors.amber ,
            // ),
          ],
          centerTitle: true, // 중앙 정렬
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
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
                      hintStyle: TextStyle(color: Colors.grey)
                      //labelText: '제목을 입력하세요',
                      //labelStyle: TextStyle(color: Colors.white),
                      //TextStyle(color: Colors.pinkAccent),
                      ),
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
                // 여기 투명의 사이즈박스가 있는 것임.
                height: 331,
                width: 392,
              )
              // Container(
              //   padding: const EdgeInsets.all(16.0),
              //   decoration:
              //       BoxDecoration(border: Border.all(), color: Colors.green),
              //   height: 331,
              //   width: 392,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
