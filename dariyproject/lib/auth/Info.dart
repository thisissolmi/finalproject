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
