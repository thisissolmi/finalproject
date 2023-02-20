import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userProvider {
  static String? user_name;
  static String? user_nameInFireStore;
  static String? user_email;
  static String? user_emailInFireStore;

  static String? user_password;
  static String? user_passwordInFireStore;
  static User? user_uid;
  static String? user_uidInFireStore;
}

class daisyuser {
  final String? user_name;
  final String? user_email;
  final String? user_password;
  final User? user_uid;

  daisyuser({
    required this.user_name,
    required this.user_email,
    required this.user_password,
    required this.user_uid,
  });

  factory daisyuser.fromFirebase(
      QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final snapshotData = docSnap.data();
    return daisyuser(
        user_name: snapshotData[user_nameFieldName],
        user_email: snapshotData[user_emailFieldName],
        user_password: snapshotData[user_passwordFieldName],
        user_uid: snapshotData[user_uidFieldName]);
  }
}

const String user_nameFieldName = 'user_name';
const String user_emailFieldName = 'user_email';
const String user_passwordFieldName = 'user_password';
const String user_uidFieldName = 'user_uid';
