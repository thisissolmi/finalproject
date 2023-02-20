import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dariyproject/diarydata.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'fontstyle.dart';
import 'readpage.dart';
import 'package:intl/intl.dart';
import './diarydata.dart';

class Write extends StatelessWidget {
  const Write({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lotte'),
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
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => const ShowDialoginSending(),
              ),
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
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          backgroundColor: const Color(0xff0A0028),
        ),
        body: const WirttingDiarypage(),
      ),
    );
  }
}

class ShowDialoginSending extends StatefulWidget {
  const ShowDialoginSending({super.key});

  @override
  State<ShowDialoginSending> createState() => _ShowDialoginSendingState();
}

class _ShowDialoginSendingState extends State<ShowDialoginSending> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('저장 할 건가요?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, '아니요'),
          child: const Text('아니요'),
        ),
        TextButton(
          onPressed: () async {
            final docref = await Firebaseprovider.mycollection.add({
              createdTimeFieldName: FieldValue.serverTimestamp(),
              titleFieldName: DataProvider.titles,
              contentFieldName: DataProvider.contents,
              keywordsFieldName: DataProvider.keywords,
            });
            final docSnapshots = await docref.get();
            if (docSnapshots.data() == null) {
              return;
            }
            final snapshotData = docSnapshots.data()!;
            DataProvider.titles = snapshotData[titleFieldName];
            DataProvider.contents = snapshotData[contentFieldName];
            DataProvider.createdTime = snapshotData[createdTimeFieldName];
            DataProvider.keywords = snapshotData[keywordsFieldName];

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Readpage()),
            );
          },
          child: const Text('예'),
        ),
      ],
    );
  }
}

class Firebaseprovider {
  static final mycollection = FirebaseFirestore.instance.collection('diary');
  static Stream<Iterable<Data>> getAllinfo() {
    return mycollection.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnap) => Data.fromFirebase(docSnap)));
  }
}

class WirttingDiarypage extends StatefulWidget {
  const WirttingDiarypage({super.key});
  @override
  State<WirttingDiarypage> createState() => _WirttingDiarypageState();
}

class _WirttingDiarypageState extends State<WirttingDiarypage> {
  TextEditingController titlecontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titlecontroller.dispose();
  }

  final String now = DateTime.now().toString();

  String? title;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextField(
          controller: titlecontroller,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: '제목을 입력하세요',
            hintStyle: TextStyle(color: Colors.grey),
          ),
          textInputAction: TextInputAction.go,
          onChanged: (value) {
            log(value);
            setState(() {
              if (value != null) {
                DataProvider.titles = titlecontroller.text;
              }
            });
          },
        ),
        const Divider(
          height: 30,
          color: Colors.white,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(nowdatetime,
              style: fontsmiddle, textAlign: TextAlign.center),
        ),
        const Camerapart(),
        const Wirtecontent(),
      ],
    );
  }
}

var now = DateTime.now();
var nowdatetime = DateFormat('yyyy-MM-dd').format(DateTime.now());

class Camerapart extends StatefulWidget {
  const Camerapart({super.key});
  @override
  State<Camerapart> createState() => CamerapartState();
}

class CamerapartState extends State<Camerapart> {
  File? imagevalue;

  Future getimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imageTemp = File(image.path);
    return setState(() {
      imagevalue = imageTemp;
    });
  }

  Widget showimage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: const Color(0xffd0cece),
        width: 291,
        height: 291,
        child: Center(
            child: imagevalue == null
                ? const Text('No image selected.')
                : Image.file(File(imagevalue!.path))),
      ),
    );
  }

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
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff7E7A8F)),
                height: 291,
                width: 291,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        getimage();
                      });
                    },
                    child: imagevalue != null
                        ? Ink.image(
                            width: 291,
                            height: 291,
                            image: NetworkImage(imagevalue.toString()),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_photo_alternate,
                                size: 50,
                              ),
                              Text('사진을 선택해주세요')
                            ],
                          )),
              ),
            ),
            const KeywordTextfield(),
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
  TextEditingController keywordcontroller = TextEditingController();
  String? textstr;
  @override
  void dispose() {
    super.dispose();
    keywordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Todys Keyword',
            style: TextStyle(color: Color(0xffF6BDE5), fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: TextField(
            controller: keywordcontroller,
            decoration: const InputDecoration(
                hintText: '#관련된 키워드를 적어보세요',
                hintStyle: TextStyle(
                  color: Color(0xffF6BDE5),
                )),
            style: const TextStyle(color: Color(0xffffffff)),
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              log(value);
              setState(() {
                if (value != null) {
                  keywordcontroller.text = value;
                  List<String> outputkeywords =
                      keywordcontroller.text.split(' ');
                  DataProvider.keywords = outputkeywords;
                }
                return;
              });
            },
          ),
        ),
      ],
    );
  }
}

class Wirtecontent extends StatefulWidget {
  const Wirtecontent({super.key});

  @override
  State<Wirtecontent> createState() => _WirtecontentState();
}

class _WirtecontentState extends State<Wirtecontent> {
  TextEditingController writtingpartcontllor = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    writtingpartcontllor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: TextField(
        textInputAction: TextInputAction.go,
        maxLines: 10,
        controller: writtingpartcontllor,
        decoration: const InputDecoration(
            hintText: '오늘의 하루를 남겨보세요!',
            hintStyle: TextStyle(
              color: Color(0xff7E7A8F),
            )),
        style: const TextStyle(color: Color(0xffffffff)),
        onChanged: (value) {
          log(value);
          setState(() {
            if (value != null) {
              DataProvider.contents = writtingpartcontllor.text;
            }
          });
        },
      ),
    );
  }
}
