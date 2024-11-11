// ignore_for_file: non_constant_identifier_names, unused_import, unnecessary_import

import 'package:blog_club/Splash.dart';
import 'package:blog_club/article.dart';
import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/homeScreen.dart';
import 'package:blog_club/mainHome.dart';
import 'package:blog_club/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String defaultFontFamily = 'Avenir';
    const Color primaryTextColor = Color(0xff0D253C);
    const Color secondaryTextColor = Color(0xff2D4379);
    const Color primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              onBackground: primaryTextColor,
              background: Color(0xffFBFCFF),
              surface: Colors.white),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              titleSpacing: 32,
              // backgroundColor: Color(0xffFBFCFF),
              titleTextStyle: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor)),
          snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontFamily: defaultFontFamily)))),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(TextStyle(
                      fontFamily: defaultFontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)))),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
              bodySmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: secondaryTextColor,
                  fontSize: 12),
              bodyLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  color: primaryTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              titleLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: secondaryTextColor),
              titleMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff376AED)),
              headlineLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 24,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700),
              headlineMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 20,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700),
              headlineSmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700),
              displaySmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2)))),
      // home: const Stack(
      //   children: [
      //     Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: BottomNavigation())
      //   ],
      // ),
      home: const SplashScreen(),
    );
  }
}
