import 'dart:developer';
import 'package:dariyproject/auth/diaryinfo.dart';
import 'package:flutter/material.dart';
import '../fontstyle/fontstyle.dart';
import 'write.dart';
import 'home.dart';
import 'moa.dart';

class Readpage extends StatelessWidget {
  const Readpage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff0A0028),
        appBar: AppBar(
          title: const Text(
            '진세진님의 교환일기',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "수정하기",
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
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          backgroundColor: const Color(0xff0A0028),
        ),
        body: const TopReadpage(),
      ),
    );
  }
}

class TopReadpage extends StatefulWidget {
  const TopReadpage({super.key});
  @override
  State<TopReadpage> createState() => _TopReadpageState();
}

class _TopReadpageState extends State<TopReadpage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          child: Text(
            DataProvider.titles.toString(),
            style: fontboldbold,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(
          height: 30,
          color: Colors.white,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(DataProvider.createdTime.toString()),
        ),
        const ReadCamerapart(),
        const Readcontent(),
      ],
    );
  }
}

class ReadCamerapart extends StatefulWidget {
  const ReadCamerapart({super.key});

  @override
  State<ReadCamerapart> createState() => _ReadCamerapartState();
}

class _ReadCamerapartState extends State<ReadCamerapart> {
  var getimage = CamerapartState();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
      child: Container(
        width: 331,
        height: 392,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xffF6BDE5), width: 1),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
              child: DataProvider.imageurl != null
                  ? Image.network(
                      DataProvider.imageurl ?? 'no data',
                      width: 291,
                      height: 291,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff7E7A8F)),
                      height: 291,
                      width: 291,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                          ),
                          Text('사진을 선택해주세요')
                        ],
                      ),
                    ),
            ),
            const KeywordTextfield()
          ],
        ),
      ),
    );
  }
}

class KeywordTextfield extends StatefulWidget {
  const KeywordTextfield({super.key});

  @override
  State<KeywordTextfield> createState() => _KeywordTextfieldState();
}

class _KeywordTextfieldState extends State<KeywordTextfield> {
  var lengthInlist = DataProvider.keywords?.length ?? 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, top: 5, bottom: 8),
          child: Text(
            'Todys Keyword',
            style: TextStyle(color: Color(0xffF6BDE5), fontSize: 15),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 24),
            child: SizedBox(
              height: 25,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    for (int i = 0; i < lengthInlist; i++) ...{
                      keywordlist(i),
                    }
                  ]),
            )),
      ],
    );
  }

  Widget keywordlist(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: const Color(0xffF6BDE5), width: 3),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text('#', style: fontboldsmall),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text(DataProvider.keywords![index], style: fontboldsmall),
            ),
          ],
        ),
      ),
    );
  }
}

Widget keywordbox(String str) {
  log(str);
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffF6BDE5), width: 3),
      ),
      child: Text(
        str,
        style: const TextStyle(color: Color(0xffF6BDE5)),
      ),
    ),
  );
}

class Readcontent extends StatefulWidget {
  const Readcontent({super.key});

  @override
  State<Readcontent> createState() => _ReadcontentState();
}

class _ReadcontentState extends State<Readcontent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: SizedBox(
          child: Text(
        DataProvider.contents.toString(),
        style: fontboldmiddle,
      )),
    );
  }
}
