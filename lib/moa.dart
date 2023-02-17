import 'package:flutter/material.dart';
import 'package:soda/write.dart';

class Moa extends StatelessWidget {
  const Moa({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        fontFamily: 'Lotte',
      ),
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
            // child: Text("김태희"),
            text: "김태희",
          ),
          Tab(text: "송하연"),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 315,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: unselectedColor, width: 0.5),
                      color: unselectedColor,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.0, color: Color(0xffF6BDE5)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: _tabBar),
                ),
              )),
        ),
        body:
            //  ListView(
            //   children: [
            //     Column(
            //       children: [
            //         Row(
            //           children: const [
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(32, 30, 0, 0),
            //               child: SizedBox(
            //                 child: Text(
            //                   "총 6개", // 변수
            //                   style: TextStyle(color: Colors.white, fontSize: 15),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(233, 30, 0, 0),
            //               child: SizedBox(
            //                 child: Text(
            //                   "최신순",
            //                   style: TextStyle(color: Colors.white, fontSize: 15),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            //           child: Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(22, 3, 9, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     // 이미지
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               /////////////////////////////////
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(8, 3, 22, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            //           child: Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(22, 3, 9, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               /////////////////////////////////
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(8, 3, 22, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            //           child: Row(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(22, 3, 9, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               /////////////////////////////////
            //               Padding(
            //                 padding: const EdgeInsets.fromLTRB(8, 3, 22, 33),
            //                 child: SizedBox(
            //                   height: 206,
            //                   width: 157,
            //                   child: Card(
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(15.0),
            //                       side: BorderSide(width: 1.0),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            /* 
            Tabbar view 안에 Listview 를 넣고 싶은데 어떻게 하지?
             */
            const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "User 1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                "작성된 교환일기가 없습니다.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Write(),
              ),
            );
          },
          child: const Icon(
            Icons.drive_file_rename_outline,
            size: 27,
            color: Colors.black,
          ),

          // 하려고 했던 이미지
          // child: Image(
          //   image: AssetImage(
          //     "images/pencil.png",
          //   ),
          //   color: Colors.blue,
          //   colorBlendMode: BlendMode.difference,
          // ),

          backgroundColor: Color(0xFFF6BDE5),
        ),

        // TabBarView(
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
