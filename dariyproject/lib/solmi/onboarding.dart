import 'package:flutter/material.dart';
import '/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    backgroundColor: const Color(0xff0A0028),
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  final _imageAssets = const [
    'assets/images/page1.png',
    'assets/images/page2.png',
    'assets/images/page3.png',
  ];
  late final PageController controller;
  Widget _pageIndicator() {
    final List<Widget> list = [];

    Color indicatorColor;

    for (int i = 0; i < _imageAssets.length; i++) {
      if (i == _currentPageIndex) {
        indicatorColor = const Color(0xFFF6BDE5);
      } else {
        indicatorColor = const Color(0xFFD8D8D8);
      }
      list.add(Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: 10,
          height: 10,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: indicatorColor),
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
    const Color(0xff0A0028);
    return Scaffold(
      backgroundColor: const Color(0xff0A0028),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 30,
          ),
          _pageIndicator(),
          Container(
            height: 60,
          ),
          Flexible(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              controller: controller,
              itemCount: _imageAssets.length,
              itemBuilder: (context, index) {
                if (index == 2) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpagepart(),
                          ));
                    },
                    child: SizedBox(
                        width: 500, child: Image.asset(_imageAssets[index])),
                  );
                }
                return SizedBox(
                    width: 500, child: Image.asset(_imageAssets[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
