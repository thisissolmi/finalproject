import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
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
    'assets/phone1.png',
    'assets/phone2.png',
    'assets/phone3.png',
  ];
  late final PageController controller;
  Widget _pageIndicator() {
    final List<Widget> list = [];
    Color indicatorColor;
    for (int i = 0; i < _imageAssets.length; i++) {
      if (i == _currentPageIndex) {
        indicatorColor = const Color(0xFF182949);
      } else {
        indicatorColor = const Color(0xFFD8D8D8);
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
