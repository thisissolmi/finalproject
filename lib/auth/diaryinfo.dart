import 'package:cloud_firestore/cloud_firestore.dart';

class DataProvider {
  static String? titles;
  static Timestamp? createdTime;
  static String? contents;
  static String? image;
  static List? keywords;
  static Data? data;
  static String? imageurl;
}

class Data {
  final String? title;
  final Timestamp? createdTime;
  final List? keywords;
  final String? content;
  final String? image;
  final String? docId;
  final String? imageurl;

  Data({
    required this.docId,
    required this.title,
    required this.createdTime,
    required this.keywords,
    required this.image,
    required this.content,
    required this.imageurl,
  });

  factory Data.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final snapshotData = snapshot.data()!;
    return Data.fromMap(snapshotData, snapshot.id);
  }

  factory Data.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final snapshotData = snapshot.data();
    return Data.fromMap(snapshotData, snapshot.id);
  }

  factory Data.fromMap(Map<String, dynamic> map, String? docId) {
    return Data(
        docId: docId,
        title: map[titleFieldName],
        createdTime: map[createdTimeFieldName],
        image: map[imageUrlFieldName],
        content: map[contentFieldName],
        keywords: map[keywordsFieldName],
        imageurl: map[imageUrlFieldName]);
  }
}

const String titleFieldName = "title";
const String createdTimeFieldName = "created-date";
const String imageUrlFieldName = "image-url";
const String contentFieldName = "content";
const String keywordsFieldName = "keywords";
const String usernameFieldName = "username";

class FirebaseProvider {
  static final mycollection = FirebaseFirestore.instance.collection('diary');
  static Stream<Iterable<Data>> getAllInfos() {
    return mycollection.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnap) => Data.fromFirebase(docSnap)));
  }
}
