import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dariyproject/auth/Info.dart';
import 'screen/home.dart';
import 'package:dariyproject/fontstyle/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth/singuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpagepart extends StatefulWidget {
  const Loginpagepart({super.key});

  @override
  State<Loginpagepart> createState() => _LoginpagepartState();
}

class _LoginpagepartState extends State<Loginpagepart> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1A1E27),
        body: SignUppart(),
      ),
    );
  }
}

class SignUppart extends StatefulWidget {
  const SignUppart({super.key});

  @override
  State<SignUppart> createState() => _SignUppartState();
}

class _SignUppartState extends State<SignUppart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('우주를 건너는 교환일기', style: fontboldmiddle),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Cosmic Diaries',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Loginpart(),
        ],
      ),
    );
  }
}

// 로그인 textfield부분입니다.
class Loginpart extends StatefulWidget {
  const Loginpart({super.key});

  @override
  State<Loginpart> createState() => LoginpartState();
}

class LoginpartState extends State<Loginpart> {
  final _authentication = FirebaseAuth.instance;
  String user_name = '';
  String user_email = '';
  String user_password = '';
  final _formkey = GlobalKey<FormState>();
  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 10, 15),
            child: TextFormField(
              key: const ValueKey(4),
              validator: ((value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'email식으로 id를 적으세요';
                }
                return null;
              }),
              onChanged: (value) {
                setState(() {
                  user_email = value;
                });
              },
              onSaved: (value) {
                user_email = value!;
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'ex)email아이디',
                  hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 10, 15),
            child: TextFormField(
              key: const ValueKey(5),
              validator: ((value) {
                if (value!.isEmpty || value.length < 6) {
                  return '최소 7자 이상 적어주세요';
                }
                return null;
              }),
              onChanged: (value) {
                setState(() {
                  user_password = value;
                });
              },
              onSaved: (value) {
                user_password = value!;
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'ex)password',
                  hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Column(
            children: [
              TextButton(
                onPressed: () async {
                  _tryValidation();
                  try {
                    final credential =
                        await _authentication.signInWithEmailAndPassword(
                            email: user_email, password: user_password);
                    log(user_email);
                  } catch (e) {
                    print(e);
                    return;
                  }
                  final user = FirebaseAuth.instance.currentUser!;
                  final documentReference = FirebaseFirestore.instance
                      .collection('user')
                      .doc(user.uid);
                  final docSnapshot = await documentReference.get();
                  print(docSnapshot.exists);
                  if (docSnapshot.exists == true) {
                    final datasnapshot = docSnapshot.data();
                    UserProvider.user_name = datasnapshot![user_nameFieldName];
                    UserProvider.partner_name =
                        datasnapshot[partner_nameFieldName];
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  }
                },
                child: Container(
                  height: 52,
                  width: 299,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF6BDE5)),
                  child: const Center(
                    child: Text(
                      '로그인',
                      style: fontsmiddlinsignup,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '계정이 없으신가요? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignUppage())));
                    },
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                          color: Color(0xffF6BDE5),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
