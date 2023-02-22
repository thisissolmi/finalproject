import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  static String? user_name;
  static String? user_nameInFireStore;
  static String? user_email;
  static String? user_emailInFireStore;

  static String? user_password;
  static String? user_passwordInFireStore;
  static List? user_uid;
  static String? user_uidInFireStore;
  static String? partner_email;
  static String? partner_emailInFireStore;
  static String? partner_name;
  static String? partner_nameInFireStore;
}

class SmallInfoProvider {
  static String? email;
  static String? emailInFireStore;
  static String? smallname;
  static String? smallnameInFireStore;
  static String? smallplace;
  static String? smallplaceInFireStore;
  static String? memo;
  static String? memoInFireStore;
  static String? bigInfoId;
  static String? bigInfoIdInFireStore;
  static String? registerTime;
  static String? registerTimeInFireStore;
}

class BigInfoProvider {
  static String? email;
  static String? emailInFireStore;
  static String? bigname;
  static String? bignameInFireStore;
  static String? bigdateStart;
  static String? bigdateStartInFireStore;
  static String? bigdateEnd;
  static String? bigdateEndInFireStore;

  static String? bigplace;
  static String? bigplaceInFireStore;
  static String? smallkey;
  static String? smallkeyInFireStore;
  static String? registerTime;
  static String? registerTimeInFireStore;
}

class Daisyuser {
  final String? user_name;
  final String? user_email;
  final String? user_password;
  final List? user_uid;
  final String? partner_email;
  final String? partner_name;

  Daisyuser({
    required this.user_name,
    required this.user_email,
    required this.user_password,
    required this.user_uid,
    required this.partner_email,
    required this.partner_name,
  });

  factory Daisyuser.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final snapshotData = docSnap.data();
    return Daisyuser(
      user_name: snapshotData[user_nameFieldName],
      user_email: snapshotData[user_emailFieldName],
      user_password: snapshotData[user_passwordFieldName],
      user_uid: snapshotData[user_uidFieldName],
      partner_email: snapshotData[partner_emailFieldName],
      partner_name: snapshotData[partner_nameFieldName],
    );
  }
}

const String user_nameFieldName = 'user_name';
const String user_emailFieldName = 'user_email';
const String user_passwordFieldName = 'user_password';
const String user_uidFieldName = 'user_uid';
const String partner_emailFieldName = 'partner_email';
const String partner_nameFieldName = 'partner_name';

class SmallInfo {
  final String? id;
  final String? smallname;
  final String? smallplace;
  final String? memo;
  final Timestamp? registerTime;
  final String? bigInfoId;

  SmallInfo(
      {required this.id,
      required this.smallname,
      required this.smallplace,
      required this.memo,
      required this.registerTime,
      required this.bigInfoId});

  factory SmallInfo.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final snapshotData = docSnap.data();
    return SmallInfo(
      id: snapshotData[idFieldName],
      registerTime: snapshotData[registerTimeFieldName],
      smallname: snapshotData[smallnameFieldName],
      smallplace: snapshotData[smallplaceFieldName],
      memo: snapshotData[memoFieldName],
      bigInfoId: snapshotData[bigInfoIdFieldName],
    );
  }
}

const String idFieldName = 'id';
const String registerTimeFieldName = "register-time";
const String smallnameFieldName = "smallname";
const String smallplaceFieldName = "smallplace";
const String memoFieldName = "memo";
const String bigInfoIdFieldName = "biginfo";

class BigInfo {
  final String? id;
  final String? bigname;
  final String? bigdateStart;
  final String? bigdateEnd;

  final String? bigplace;
  final String? smallkey;
  final Timestamp? registerTime;

  BigInfo(
      {required this.id,
      required this.bigname,
      required this.bigdateStart,
      required this.bigdateEnd,
      required this.bigplace,
      required this.smallkey,
      required this.registerTime});

  factory BigInfo.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final snapshotData = docSnap.data();
    return BigInfo(
      id: snapshotData[idFieldName],
      registerTime: snapshotData[registerTimeFieldName],
      bigname: snapshotData[bignameFieldName],
      bigdateStart: snapshotData[bigdateStartFieldName],
      bigdateEnd: snapshotData[bigdateEndFieldName],
      bigplace: snapshotData[bigplaceFieldName],
      smallkey: snapshotData[smallkeyFieldName],
    );
  }
}

const String bignameFieldName = "bigname";
const String bigdateStartFieldName = "bigdateStart";
const String bigdateEndFieldName = "bigdateEnd";
const String bigplaceFieldName = "bigplace";
const String smallkeyFieldName = "smallkey";

Future<void> fetchAuthInfo() async {
  Map data = {};
  UserProvider.user_email = FirebaseAuth.instance.currentUser!.uid;
  var docref = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  docref.get().then((doc) => {
        (DocumentSnapshot doc) {
          data = doc.data() as Map<String, dynamic>;
          print(data);
        },
      });

  UserProvider.partner_email = (await FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get())['partner-user-id'];
}
