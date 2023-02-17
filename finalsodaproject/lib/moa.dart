import 'package:flutter/material.dart';
import 'package:soda/write.dart';
import 'main.dart';

class Moa extends StatelessWidget {
  const Moa({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: DiaryListPage(),
    );
  }
}

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({super.key});

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  Color unselectedColor = const Color(0xff0A0028);

  TabBar get _tabBar => TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        //backgroundColor: Colors.white,
        indicator: BoxDecoration(
          color: const Color(0xffF6BDE5),
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
        backgroundColor: const Color(0xff0A0028),
        appBar: AppBar(
          title: const Text(
            '교환일기 모아보기',
          ),
          centerTitle: true, // 중앙 정렬
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
          bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Container(
                width: 315,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: unselectedColor, width: 1),
                    color: unselectedColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: const Color(0xffF6BDE5)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _tabBar),
              )),
        ),
        body: Row(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: SizedBox(
                  child: Text(
                "총 @개",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SizedBox(
                child: Text("최신순"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
