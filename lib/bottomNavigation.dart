// ignore_for_file: unnecessary_import, file_names

import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/mainHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff9b8487).withOpacity(0.3),
                          blurRadius: 20)
                    ],
                    border: Border.all(color: Colors.white, width: 4)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: const Color(0xff9b8487).withOpacity(0.3),
                    blurRadius: 20)
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavigationItem(
                        iconFileName: const Icon(Icons.home_outlined),
                        activeIconFileName: const Icon(Icons.home_outlined),
                        onTap: () {
                          onTap(homeIndex);
                        },
                        isActive: selectedIndex == homeIndex,
                        title: 'Home'),
                    BottomNavigationItem(
                        iconFileName: const Icon(Icons.article_outlined),
                        activeIconFileName: const Icon(Icons.article_outlined),
                        onTap: () {
                          onTap(articleIndex);
                        },
                        isActive: selectedIndex == articleIndex,
                        title: 'Article'),
                    Expanded(child: Container()),
                    BottomNavigationItem(
                        iconFileName: const Icon(Icons.search_outlined),
                        activeIconFileName: const Icon(Icons.search_outlined),
                        onTap: () {
                          onTap(searchIndex);
                        },
                        isActive: selectedIndex == searchIndex,
                        title: 'Search'),
                    BottomNavigationItem(
                        iconFileName: const Icon(Icons.menu_open_outlined),
                        activeIconFileName:
                            const Icon(Icons.menu_open_outlined),
                        onTap: () {
                          onTap(menuIndex);
                        },
                        isActive: selectedIndex == menuIndex,
                        title: 'Menu')
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: const Color(0xff376AED),
                      borderRadius: BorderRadius.circular(32.5),
                      border: Border.all(color: Colors.white, width: 4)),
                  child: Assets.img.icons.plus.image()),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final Icon iconFileName;
  final Icon activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isActive
                ? Icon(activeIconFileName.icon,
                    size: 30, color: themeData.colorScheme.primary)
                : Icon(
                    iconFileName.icon,
                    size: 28,
                  ),
            Text(title,
                style: themeData.textTheme.bodyLarge!.apply(
                    color: isActive
                        ? themeData.colorScheme.primary
                        : themeData.textTheme.bodyLarge!.color))
          ],
        ),
      ),
    );
  }
}
