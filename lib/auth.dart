import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextTheme = TextStyle(
        fontSize: 18,
        color: themeData.colorScheme.surface,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Assets.img.icons.logo.svg(width: 110),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = loginTab;
                            });
                          },
                          child: Text(
                            'LOGIN',
                            style: tabTextTheme.apply(
                                color: selectedTabIndex == loginTab
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text('SIGN UP',
                                style: tabTextTheme.apply(
                                    color: selectedTabIndex == signUpTab
                                        ? Colors.white
                                        : Colors.white54)))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 40, 32, 0),
                        child: SingleChildScrollView(
                          child: selectedTabIndex == loginTab
                              ? _Login(themeData: themeData)
                              : _SignUp(themeData: themeData),
                        ),
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

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text('Sign in with your account'),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.sizeOf(context).width, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: themeData.colorScheme.primary),
            onPressed: () {},
            child: Text(
              'login'.toUpperCase(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: themeData.colorScheme.onPrimary),
            )),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            const SizedBox(
              width: 16,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Reset here',
                  style: TextStyle(color: themeData.colorScheme.primary),
                ))
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              const SizedBox(
                width: 32,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              const SizedBox(
                width: 32,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36)
            ],
          ),
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to blog club',
          style: themeData.textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text('Please inter your information'),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Fullname'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.sizeOf(context).width, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: themeData.colorScheme.primary),
            onPressed: () {},
            child: Text(
              'login'.toUpperCase(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: themeData.colorScheme.onPrimary),
            )),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2, fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              const SizedBox(
                width: 32,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              const SizedBox(
                width: 32,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36)
            ],
          ),
        )
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text('Password'),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                      widget.themeData.colorScheme.surface)),
              child: Text(obscureText ? 'Show' : 'Hide'),
            ),
          )),
    );
  }
}
