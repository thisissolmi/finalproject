import 'package:flutter/material.dart';

/*
return AlertDialog(
                                      // elevation: 100,
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      title: Center(
                                        child: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 5),
                                              child: Text('로그아웃'),
                                            ),
                                            Divider(
                                              thickness: 2,
                                            )
                                          ],
                                        ),
                                      ),
                                      content: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(35, 0, 0, 0),
                                        child: Text('로그아웃 하시겠습니까? '),
                                      ),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24))),
                                      actions: [
                                        OutlinedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(const Mypage());
                                          },
                                          child: Text('취소', style: TextStyle()),
                                          style: OutlinedButton.styleFrom(
                                              fixedSize: Size(120, 40),
                                              foregroundColor:
                                                  Color(0xff8C8F93),
                                              side: BorderSide(
                                                color: Color(0xff8C8F93),
                                                width: 1.0,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  21.5)))),
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('로그아웃'),
                                            style: OutlinedButton.styleFrom(
                                                fixedSize: Size(120, 40),
                                                foregroundColor:
                                                    Color(0xFFD66ED1),
                                                side: BorderSide(
                                                  color: Color(0xFFD66ED1),
                                                  width: 1.0,
                                                ),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    21.5))))),
                                      ],
                                    );
                                     */

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('잠시만요!'),
              content: const Text('아직 교환일기를 다 완성하지 못했어요'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                      '확인'), // 스타일 추천하기 테두리나.. 아웃라인 두께나..등등 weight ...1
                ),
              ],
            ),
          ),
          // 얘는 다 요소가 총족되지 못했는데, 보내기 버튼을 누르려고 했을 때 경고창이 뜨게 하는 것임.

          child: const Text('보내기'), // 보내기 버튼 눌렀을때가 뜨는 것임
        ),
      ),
    );
  }
}



/*


//Dialogp01
        child: TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('잠시만요!'),
              content: const Text('아직 교환일기를 다 완성하지 못했어요'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text(
                      '확인'), // 스타일 추천하기 테두리나.. 아웃라인 두께나..등등 weight ...1
                ),
              ],
            ),
          ),
          // 얘는 다 요소가 총족되지 못했는데, 보내기 버튼을 누르려고 했을 때 경고창이 뜨게 하는 것임.

          child: const Text('보내기'), // 보내기 버튼 눌렀을때가 뜨는 것임
        ),


        //Dialog02
        child: TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('나가시겠습니까?'),
              content: const Text('작성중인 일기는 저장되지 않습니다.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('아니요'), // 스타일 추가하기
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('예'), //스타일 추가하기
                ),
              ],
            ),
          ),
          // 얘는 다 안썼는데, 이전버튼 눌러서 글쓰기 화면 페이지에서 나가려고 할 때 띄워야하는 것임.
          child: const Text('보내기'), // 이전 버튼 < 를 눌렀을 때 뜨는 것임.
        ),


        //Diaglog03
        child: TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('일기 보내기'),
              content: const Text('일기를 보내시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('취소'), // 스타일 추가하기
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('보내기'), //스타일 추가하기
                ),
              ],
            ),
          ),
          // 얘는 조건 다 총족 하고, 보내기 
          child: const Text('보내기'), // 보내기 버튼 눌렀을 때임. 
        ),
*/

        // //Diaglog04
        // //mypage에서 로그아웃 버튼 눌렀을 때 나오는 페이지임. 따라서 navigator.push 했을 때 이 dialog 가 나오면 됌.

        //  child: TextButton(
        //   onPressed: () => showDialog<String>(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //       title: const Text('로그아웃'),
        //       content: const Text('로그아웃 하시겠습니까?'),
        //       actions: <Widget>[
        //         TextButton(
        //           onPressed: () => Navigator.pop(context, 'Cancel'),
        //           child: const Text('취소'), // 스타일 추가하기
        //         ),
        //         TextButton(
        //           onPressed: () => Navigator.pop(context, 'OK'),
        //           child: const Text('로그아웃'), //스타일 추가하기
        //         ),
        //       ],
        //     ),
        //   ),
        //   // 얘는 조건 다 총족 하고, 보내기
        //   child: const Text('보내기'), // 보내기 버튼 눌렀을 때임.
        // ),


/*
floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
              context: context, // scaffold에 있는 context 임
              builder: (BuildContext) => AlertDialog(
                    title: Text("나가시겠습니까?"),
                    content: const Text('작성 중인 일기는 저장되지 않습니다.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('아니오'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('예'),
                      ),
                    ],
                  )),
          backgroundColor: Color(0xff182949),
          child: const Icon(Icons.add),
      ),
       */
