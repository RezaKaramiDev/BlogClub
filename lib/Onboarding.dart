// ignore_for_file: file_names

import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
// ignore: unused_import
import 'package:blog_club/homeScreen.dart';
import 'package:blog_club/mainHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final items = AppDatabase.onBoardingItems;
  final PageController _pageController = PageController();
  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 8),
              child: Assets.img.background.onboarding.image(),
            ),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 10)
                ]),
            child: Container(
              padding: const EdgeInsets.fromLTRB(28, 32, 28, 0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        itemCount: items.length,
                        physics: const BouncingScrollPhysics(),
                        controller: _pageController,
                        itemBuilder: ((context, index) {
                          final item = items[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: themeData.textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(item.description)
                              ],
                            ),
                          );
                        })),
                  ),
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: items.length,
                            effect: ExpandingDotsEffect(
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary
                                    .withOpacity(0.2),
                                dotHeight: 8,
                                dotWidth: 8),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(88, 60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor:
                                      themeData.colorScheme.primary),
                              onPressed: () {
                                if (page == items.length - 1) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()));
                                } else {
                                  _pageController.animateToPage(page + 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.decelerate);
                                }
                              },
                              child: page == items.length - 1
                                  ? Icon(
                                      CupertinoIcons.check_mark,
                                      color: themeData.colorScheme.surface,
                                    )
                                  : Icon(
                                      CupertinoIcons.arrow_right,
                                      color: themeData.colorScheme.surface,
                                    ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
