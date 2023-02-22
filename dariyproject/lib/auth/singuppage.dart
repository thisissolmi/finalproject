import 'dart:developer';
import 'package:dariyproject/auth/Info.dart';
import 'package:dariyproject/fontstyle/fontstyle.dart';
import 'package:dariyproject/screen/home.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Info.dart';
import 'package:dariyproject/login.dart';

class SignUppage extends StatelessWidget {
  const SignUppage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff1A1E27),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff1A1E27),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Loginpagepart()),
                ),
              );
            },
          ),
          title: const Text(
            '회원가입',
            style: fontboldbold,
          ),
        ),
        body: const SignUppagebadypart(),
      ),
    );
  }
}

class SignUppagebadypart extends StatefulWidget {
  const SignUppagebadypart({super.key});

  @override
  State<SignUppagebadypart> createState() => _SignUppagebadypartState();
}

class _SignUppagebadypartState extends State<SignUppagebadypart> {
  final _authentication = FirebaseAuth.instance;
  String user_name = '';
  String user_email = '';
  String user_password = '';
  String partner_email = '';
  final _formkey2 = GlobalKey<FormState>();
  void _tryValidation() {
    final isValid = _formkey2.currentState!.validate();
    if (isValid) {
      _formkey2.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0),
            child: Text(
              '이름',
              style: fontsmiddlinsignup,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0),
            child: TextFormField(
              key: const ValueKey(1),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'ex)이름',
                  hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
              validator: ((value) {
                if (value!.isEmpty || value.length > 2) {
                  return '최소 3자 이상 적어주세요';
                }
                return null;
              }),
              onChanged: (value) {
                user_name = value;
              },
              onSaved: (value) {
                user_name = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0),
            child: TextFormField(
              key: const ValueKey(2),
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
              validator: ((value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'email형식으로 해주세요';
                }
                return null;
              }),
              onChanged: (value) {
                user_email = value;
              },
              onSaved: (value) {
                user_email = value!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0),
            child: TextFormField(
              key: const ValueKey(3),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'ex)비밀번호',
                  hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
              validator: ((value) {
                if (value!.isEmpty || value.length > 6) {
                  return '최소 7자 이상 적어주세요';
                }
                return null;
              }),
              onChanged: (value) {
                user_password = value;
              },
              onSaved: (value) {
                user_password = value!;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0),
            child: TextFormField(
              key: const ValueKey(4),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'ex)상대방 email을 적어주세요',
                  hintStyle: TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
              validator: ((value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return '최소 7자 이상 적어주세요';
                }
                return null;
              }),
              onChanged: (value) {
                partner_email = value;
              },
              onSaved: (value) {
                partner_email = value!;
              },
            ),
          ),
          GestureDetector(
              onTap: () async {
                _tryValidation();
                try {
                  UserCredential userCredential =
                      await _authentication.createUserWithEmailAndPassword(
                          email: user_email, password: user_password);
                } catch (e) {
                  print(e);
                }
                final db = FirebaseFirestore.instance;
                final user = FirebaseAuth.instance.currentUser!;
                final docref = db.collection('user').doc(user.uid);
                await docref.set({
                  user_nameFieldName: user_name,
                  user_emailFieldName: user_email,
                  user_passwordFieldName: user_password,
                  user_uidFieldName: user.uid,
                  partner_emailFieldName: partner_email,
                });
                final docsnapshot = await docref.get();
                if (docsnapshot.data() == null) {
                  return;
                }
                final datasnapsot = docsnapshot.data()!;

                UserProvider.user_name = datasnapsot[user_nameFieldName];
                UserProvider.partner_email =
                    datasnapsot[partner_emailFieldName];
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const Partnerpage())));
              },
              child: Container(
                width: 100,
                height: 50,
                color: const Color(0xffF6BDE5),
                child: const Center(
                  child: Text(
                    '회원가입',
                    style: loginpageloginblack,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class Partnerpage extends StatelessWidget {
  const Partnerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff0A0028),
        body: Partnertextfield(),
      ),
    );
  }
}

class Partnertextfield extends StatefulWidget {
  const Partnertextfield({super.key});

  @override
  State<Partnertextfield> createState() => _PartnertextfieldState();
}

class _PartnertextfieldState extends State<Partnertextfield> {
  final _authentication = FirebaseAuth.instance;
  String partner_email = '';
  String partner_name = '';
  final _formkeypart = GlobalKey<FormState>();
  void _tryValidation() {
    final isValid = _formkeypart.currentState!.validate();
    if (isValid) {
      _formkeypart.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formkeypart,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey(1),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'ex)파트너 Nickname이름',
                    hintStyle:
                        TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
                validator: ((value) {
                  if (value!.isEmpty || value.length > 2) {
                    return '최소 3자 이상 적어주세요';
                  }
                  return null;
                }),
                onChanged: (value) {
                  partner_name = value;
                },
                onSaved: (value) {
                  partner_name = value!;
                },
              ),
              TextFormField(
                key: const ValueKey(2),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'ex)파트너 email이름',
                    hintStyle:
                        TextStyle(color: Color(0xff9D99A9), fontSize: 17)),
                validator: ((value) {
                  if (value!.isEmpty || value.length > 2) {
                    return '최소 3자 이상 적어주세요';
                  }
                  return null;
                }),
                onChanged: (value) {
                  partner_email = value;
                },
                onSaved: (value) {
                  partner_email = value!;
                },
              ),
            ],
          ),
        ),
        GestureDetector(
            onTap: () async {
              _tryValidation();
              final userInfo = FirebaseFirestore.instance
                  .collection('user')
                  .where('user_email', isEqualTo: partner_email)
                  .snapshots();
              final isEmpty = await userInfo.isEmpty;
              if (isEmpty) return;
              final partneruserID =
                  (await userInfo.first).docs.first.data()['user_email'];
              log(partneruserID);
              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .update({'partner_email': partneruserID});
              UserProvider.partner_email = partneruserID;

              final userInfo2 = FirebaseFirestore.instance
                  .collection('user')
                  .where('user_name', isEqualTo: partner_name)
                  .snapshots();
              final isEmpty2 = await userInfo2.isEmpty;
              if (isEmpty2) return;
              final partnerusername =
                  (await userInfo.first).docs.first.data()['user_name'];
              log(partnerusername);
              UserProvider.partner_name = partnerusername;
              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .update({'partner_name': partnerusername});

              // ignore_for_file: use_build_context_synchronously
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const Homepage())),
                  (route) => false);
            },
            child: Container(
              width: 100,
              height: 50,
              color: const Color(0xffF6BDE5),
              child: const Center(
                child: Text(
                  '완료',
                  style: loginpageloginblack,
                ),
              ),
            )),
      ],
    );
  }
}
