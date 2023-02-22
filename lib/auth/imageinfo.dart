import 'package:cloud_firestore/cloud_firestore.dart';

class DataProvider {
  static String? id;
  static Timestamp? createdTime;
  static String? imageurl;
  static Imageinfo? imageinfo;
}

class Imageinfo {
  final String? documentid;
  final Timestamp? craeatedtimeinimgae;
  final String? image_url;

  Imageinfo({
    required this.documentid,
    required this.craeatedtimeinimgae,
    required this.image_url,
  });

  factory Imageinfo.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final snapshotData = snapshot.data()!;
    return Imageinfo.fromMap(snapshotData, snapshot.id);
  }

  factory Imageinfo.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final snapshotData = snapshot.data();
    return Imageinfo.fromMap(snapshotData, snapshot.id);
  }

  factory Imageinfo.fromMap(Map<String, dynamic> map, String? docId) {
    return Imageinfo(
      documentid: docId,
      craeatedtimeinimgae: map[created_TimeFieldName],
      image_url: map[imageUrl_FieldName],
    );
  }
}

const String created_TimeFieldName = "created-date";
const String imageUrl_FieldName = "image-url";

class FirebaseimgaeProvider {
  static final mycollection = FirebaseFirestore.instance.collection('post');
  static Stream<Iterable<Imageinfo>> getAllInfos() {
    return mycollection.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnap) => Imageinfo.fromFirebase(docSnap)));
  }
}
