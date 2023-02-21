import 'package:flutter/material.dart';
// 온보딩 스크인 외부패키지 임포트(https://pub.dev/packages/introduction_screen/install)
import 'package:introduction_screen/introduction_screen.dart';
import 'package:neeww/main.dart';
import 'package:neeww/splahpage.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:testflutter/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // 대부분의 온보딩 스크린은 여러 페이지로 구성되어 있으므로
        // Column 위젯처럼 pages 아규먼트는 이처럼 리스트를 불러와야 함.
        // PageViewModel = 안에서 각 페이지 구성을 담당
        PageViewModel(
            // 첫번째 페이지
            title: 'Welcome to my app',
            body: 'This is first page',
            image: Image.asset('assets/images/page1.png', height: 175.0),
            // 새로운 메서드를 하나 만들어 필요한 내용들을 미리 지정해두고 간단히 불러오기 위해 PageDecoration 사용
            decoration: getPageDecoration()),
        PageViewModel(
            // 두번째 페이지
            title: 'hello',
            body: 'This is second page',
            image: Image.asset('assets/images/page2.png', height: 175.0),
            decoration: getPageDecoration()),
        PageViewModel(
            // 세번째 페이지
            title: 'hello',
            body: 'This is third page',
            image: Image.asset('assets/images/page3.png', height: 175.0),
            decoration: getPageDecoration()),
      ],
      // done = 온보딩 스크린의 마지막 페이지까지 보았을 때 무엇을 할지 지정해주는 버튼
      done: const Text('Done'),
      // onDone = done 버튼이 터치가 되면 무엇을 할지 지정해주는 아규먼트
      // 대부분 온보딩 스크린이 끝나고 버튼을 누르면 앱의 시작 페이지로 이동(버튼의 onPressed 메서드와 동일)
      // push 메서드를 pushReplacement 메서드로 바꿀 경우 페이지를 다 보고 done을 눌렀을 때 메인 페이지에서 다시 온보드 페이지로 가는 뒤로가기 버튼 비활성화
      onDone: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const MyHomePage()), // MyPage 위젯 리턴
        );
      },
      next: MyHomePage(),
      // next = 다음 페이지로 이동
      // 아이콘도 지정되면 바뀌지 않으므로 const 처리
      // showBackButton = 뒤로가기 버튼 활성화 여부, 첫번째 페이지가 아닐 때 활성화
      //showBackButton: true,
      back: const Icon(Icons.arrow_back_ios), // 아이콘도 지정되면 바뀌지 않으므로 const 처리,
      //showSkipButton = 스킵 버튼 활성화 여부
      showSkipButton: true,
      // // skip = 스킵 버튼
      skip: const Text('skip'),
      // dotsDecorator = 하단의 페이지 점들에 대한 스타일 지정
      dotsDecorator: DotsDecorator(
        color: const Color(0xFFF6BDE5),
        activeColor: const Color(0xFFF2F4F6),
        size: Size(10, 10),
        activeSize: Size(10, 10),
        spacing: EdgeInsets.all(10),
        activeShape: // shape 및 round 설정
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      curve: Curves.bounceOut, // 넘김 애니메이션 속성
    );
  }

//bool get sizedByParent => true;
  // 클래스에 관련된 내용만을 다루어야 하므로 PageDecoration 타입의 getPageDecoration 클래스 생성
  // 실제 PageDecoration 클래스의 속성들은 필요한 것들만 그때그때 사용할 수 있도록 네임드 아규먼트로 구성되어 있기 때문에 메서드에 별 다른 인자값을 전달할 필요 없음
  // 메서드의 바디에서 PageDecoration 위젯을 리턴
  // 새롭게 생성된 PageDecoration 위젯 인스턴스 내에 원하는 아규먼트를 불러와서 페이지 디자인을 해주면 됨
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 40), // 이미지 padding
      pageColor: Color(0xff0A0028), // 배경색상
    );
  }
}
 
 

/*


import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'main.dart';
import './page1.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            image: Image.asset('image/page1.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            image: Image.asset('image/page2.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            image: Image.asset('image/page3.png'),
            decoration: getPageDecoration()),
      ],
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
      },
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
        imagePadding: EdgeInsets.only(top: 40), pageColor: Color(0xff0A0028));
  }
}

*/ 

/* 
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import './page1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const OnboardingPage());
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _controller = PageController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                Page1(
                  "assets/images/page1.png",
                ),
                Page1(
                  "assets/images/page2.png",
                ),
                Page1(
                  "assets/images/page3.png",
                  // Color(0xff0A0028),
                ),
              ],
            ),
            // SafeArea(
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         const Spacer(),
            //         SmoothPageIndicator(
            //           controller: _controller,
            //           count: 3,
            //         ),

            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

*/


/*

class PageModel extends StatefulWidget {

  const PageModel({super.key});

  @override
  State<PageModel> createState() => _PageModelState();
}

class _PageModelState extends State<PageModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     final pageList = [
    PageModel(
        color: const Color(0xff0A0028),//backgroundColor: const Color(0xff0A0028),
        // heroImagePath: 'assets/png/hotels.png',
        
        body: Image.asset('assets.images/page1.png'),
        // body: Text('All hotels and hostels are sorted by hospitality rating',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18.0,
        //     )),
       // iconImagePath: 'assets/png/key.png'),
    PageModel(
        color: const Color(0xff0A0028),
        // heroImagePath: 'assets/png/banks.png',
        
       body: Image.asset('assets.images/page1.png'),
        // iconImagePath: 'assets/png/wallet.png'),
    PageModel(
      color: const Color(0xff0A0028),
      // heroImagePath: 'assets/png/stores.png',
      // title: Text('Store',
      //     style: TextStyle(
      //       fontWeight: FontWeight.w800,
      //       color: Colors.white,
      //       fontSize: 34.0,
      //     )),
      body: Image.asset('assets.images/page1.png'),
      // body: Text('All local stores are categorized for your convenience',
          // textAlign: TextAlign.center,
          // style: TextStyle(
          //   color: Colors.white,
          //   fontSize: 18.0,
          // )),
      // icon: Icon(
      //   Icons.shopping_cart,
      //   color: const Color(0xFF9B90BC),
      // ),
    ),
    // SVG Pages Example
    
    ),
    ),
  ];


    );
  }
}



//건너뛰기 위젯 
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FancyOnBoarding(
//         doneButtonText: "Done",
//         skipButtonText: "Skip",
//         pageList: pageList,
//         onDoneButtonPressed: () =>
//             Navigator.of(context).pushReplacementNamed('/mainPage'),
//         onSkipButtonPressed: () =>
//             Navigator.of(context).pushReplacementNamed('/mainPage'),
//       ),
//     );
//   }


*/ 

/*

번외

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  final _imageAssets = const [
    'assets/images/page1.png',
    'assets/images.page2.png',
    'assets/images/page3.png',
  ];
  late final PageController controller;
  Widget _pageIndicator() {
    final List<Widget> list = [];
    Color indicatorColor;
    for (int i = 0; i < _imageAssets.length; i++) {
      if (i == _currentPageIndex) {
        indicatorColor = const Color(0xFF182949);
      } else {
       indicatorColor = const Color(0xFF182949);
      }
      list.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          radius: 6,
          backgroundColor: indicatorColor,
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: list,
    );
  }

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
        controller: controller,
        itemCount: _imageAssets.length,
        itemBuilder: (context, index) {
          return BasePage(
            imageAsset: _imageAssets[index],
          );
        },
      ),
      bottomSheet: _pageIndicator(),
    );
  }
}

class BasePage extends StatelessWidget {
  const BasePage({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
        ),
        Image.asset(imageAsset),
        const Text(
          "Copyright 2023 SODA. All right reserved.",
          style: TextStyle(
            color: Color(0xFFB7B6B6),
          ),
        ),
      ],
    );
  }
}
*/

