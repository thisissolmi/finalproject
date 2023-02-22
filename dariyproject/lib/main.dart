import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dariyproject/auth/Info.dart';
import 'screen/home.dart';
import 'package:dariyproject/fontstyle/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';
import '/solmi/onboarding.dart';
import 'login.dart';
import 'solmi/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Fistpage());
}

class Fistpage extends StatelessWidget {
  const Fistpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lotte',
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
