import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/screen/home.dart';
import 'package:flutter/material.dart';
import 'write.dart';
import 'package:dariyproject/auth/Info.dart';
import '/auth/diaryinfo.dart';
import '/fontstyle/fontstyle.dart';
import 'package:intl/intl.dart';
import './readpage.dart';
import 'package:dariyproject/auth/singuppage.dart';

class Moa extends StatelessWidget {
  const Moa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DiaryListPage(),
    );
  }
}

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({super.key});

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  Tabbarviewinmoa a = Tabbarviewinmoa();
  Color unselectedColor = const Color(0xff0A0028);
  TabBar get _tabBar => TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        //backgroundColor: Colors.white,
        indicator: BoxDecoration(
          color: const Color(0xffF6BDE5),
          borderRadius: BorderRadius.circular(200),
        ),
        tabs: [
          Tab(text: UserProvider.user_name),
          if (UserProvider.partner_name != null) ...{
            Text("${UserProvider.partner_name}님", style: homepagecouple),
          } else
            const Text("당신은 솔로...", style: homepagecouple),
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
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
          ),
          backgroundColor: const Color(0xff0A0028),
          bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Column(
                children: [
                  Container(
                    width: 315,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: unselectedColor, width: 1),
                        color: unselectedColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: const Color(0xffF6BDE5)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: _tabBar),
                  ),
                ],
              )),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '총' '${counter ?? '0'}' '개',
                    style: fontboldsmall,
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 50,
                )),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('최신순', style: fontboldsmall),
                ),
              ],
            ),
            const Tabbarviewinmoa(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Write(),
              ),
            );
          },
          child: Icon(
            Icons.drive_file_rename_outline,
            size: 27,
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFFF6BDE5),
        ),
      ),
    );
  }

  Widget timetoreal() {
    if (DataProvider.createdTime != null) {
      var nowdatetime = DateFormat('yyyy년 MM월 dd일').format(
          DateTime.parse(DataProvider.createdTime!.toDate().toString()));
    }
    return Text(
      nowdatetime.toString(),
      style: fontboldsmall,
    );
  }
}

class FirebasebigProvider {
  static final mycollection = FirebaseFirestore.instance.collection('biginfo');
  static Stream<Iterable<Data>> getAllInfos() {
    return mycollection
        .orderBy("created-date", descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((docSnap) => Data.fromFirebase(docSnap)));
  }
}

class FirebasesmaillProvider {
  static final mycollection =
      FirebaseFirestore.instance.collection('smailinfo');
  static Stream<Iterable<Data>> getAllInfos() {
    return mycollection
        .orderBy("created-date", descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((docSnap) => Data.fromFirebase(docSnap)));
  }
}

class Tabbarviewinmoa extends StatefulWidget {
  const Tabbarviewinmoa({super.key});

  @override
  State<Tabbarviewinmoa> createState() => TabbarviewinmoaState();
}

int? counter;

class TabbarviewinmoaState extends State<Tabbarviewinmoa> {
  String? Imageurleach;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          StreamBuilder(
            stream: FirebasebigProvider.getAllInfos(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                  if (snapshot.data == null) {
                    return const Text("no data");
                  }
                  if (snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Center(
                        child: Text(
                          " 새 교환일기를 추가해주세요.",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff737779)),
                        ),
                      ),
                    );
                  }
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data!.length, (index) {
                      if (snapshot.data == null) {
                        log('error');
                      }
                      final asnycSnapshot = snapshot.data!.toList();
                      final snapstitle = asnycSnapshot[index].title;
                      final snapshotimageurl = asnycSnapshot[index].imageurl;
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (snapshot.data != null) {
                              final asnycSnapshot = snapshot.data!.toList();
                              final snapshotdatatitle =
                                  asnycSnapshot[index].title;
                              final snapshotdatakeyword =
                                  asnycSnapshot[index].keywords;
                              final snapshotcontent =
                                  asnycSnapshot[index].content;
                              final snapshotimageurl =
                                  asnycSnapshot[index].imageurl;
                              DataProvider.titles = snapshotdatatitle;
                              DataProvider.keywords = snapshotdatakeyword;
                              DataProvider.contents = snapshotcontent;
                              DataProvider.imageurl = snapshotimageurl;
                              counter = snapshot.data!.length;
                              Imageurleach = DataProvider.imageurl;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const Readpage())));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 10, 17, 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xffF6BDE5),
                              ),
                            ),
                            height: 206,
                            width: 157,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image(
                                    width: 160,
                                    height: 130,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshotimageurl ??
                                          'https://raw.githubusercontent.com/thisissolmi/finalproject/second/assets/images/jaejae.png',
                                    )),
                              ),
                              Text(snapstitle ?? 'nodata', style: fontboldbold),
                              timetoreal(),
                            ]),
                          ),
                        ),
                      );
                    }),
                  );
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
          StreamBuilder(
            stream: FirebasesmaillProvider.getAllInfos(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                  if (snapshot.data == null) {
                    return const Text("no data");
                  }
                  if (snapshot.data == null) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Center(
                        child: Text(
                          " 새 교환일기를 추가해주세요.",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff737779)),
                        ),
                      ),
                    );
                  }
                  return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data!.length, (index) {
                      if (snapshot.data == null) {
                        throw Exception();
                      }
                      final asnycSnapshot = snapshot.data!.toList();
                      final snapshotdatatitle = asnycSnapshot[index].title;
                      final snapshotdatakeyword = asnycSnapshot[index].keywords;
                      final snapshotcontent = asnycSnapshot[index].content;
                      final snapshotimageurl = asnycSnapshot[index].imageurl;
                      DataProvider.titles = snapshotdatatitle;
                      DataProvider.keywords = snapshotdatakeyword;
                      DataProvider.contents = snapshotcontent;
                      DataProvider.imageurl = snapshotimageurl;
                      return GestureDetector(
                        onTap: () async {
                          if (snapshot.data == null) {
                            return;
                          }
                          final asnycSnapshot = snapshot.data!.toList();
                          final snapshotdatatitle = asnycSnapshot[index].title;
                          final snapshotdatakeyword =
                              asnycSnapshot[index].keywords;
                          final snapshotcontent = asnycSnapshot[index].content;
                          final snapshotimageurl =
                              asnycSnapshot[index].imageurl;
                          DataProvider.titles = snapshotdatatitle;
                          DataProvider.keywords = snapshotdatakeyword;
                          DataProvider.contents = snapshotcontent;
                          DataProvider.imageurl = snapshotimageurl;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Readpage())));
                        },
                        child: Container(
                          height: 205,
                          width: 159,
                          child: Column(children: [
                            const Image(
                                image: NetworkImage(
                                    'https://raw.githubusercontent.com/thisissolmi/finalproject/second/assets/images/jaejae.png',
                                    scale: 4)),
                            Text('${DataProvider.titles}', style: fontboldbold),
                            timetoreal(),
                          ]),
                        ),
                      );
                    }),
                  );
                default:
                  return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget timetoreal() {
    if (DataProvider.createdTime != null) {
      var nowdatetime = DateFormat('yyyy년 MM월 dd일').format(
          DateTime.parse(DataProvider.createdTime!.toDate().toString()));
    }
    return Text(
      nowdatetime.toString(),
      style: fontboldsmall,
    );
  }
}
