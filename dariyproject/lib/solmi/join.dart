import 'package:flutter/material.dart';
// 회원 가입 페이지

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      appBar: AppBar(
        backgroundColor:const Color(0xff0A0028),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            /* 이미지 넣는 법 알기 */
            // Image.asset('assets/images/lightpink.png'),
            // Image.asset('assets/image/heavypink.png')
            // Image.asset("assets/images/lightpink.png"),
            //  Image.asset('assets/image/lightpink.png'),
            
            SizedBox(height: 100, width: 100),
            Text(
              "우주를 건너는 교환일기",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              "Cosmic Diaries",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            
          ],
          
        ),
      ),
    );
  }
}
