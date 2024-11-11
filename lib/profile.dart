import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppBar(
                backgroundColor:
                    themeData.colorScheme.background.withOpacity(0),
                title: const Text('Profile'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onSurface
                                  .withOpacity(0.1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Assets.img.stories.story4
                                      .image(width: 85, height: 85)),
                              const SizedBox(
                                width: 32,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '@issidan',
                                      style: themeData.textTheme.bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w200),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Isabella Daniel',
                                      style: themeData.textTheme.headlineSmall,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'UX Designer',
                                      style: themeData.textTheme.titleMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
                          child: Text('About me',
                              style: themeData.textTheme.headlineSmall!
                                  .copyWith(fontSize: 16)),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(32, 0, 32, 52),
                          child: Text(
                              'Madison Blackstone is a director of user experience design, with experience managing global teams.'),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onSurface)
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff2151CD),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: themeData.textTheme.headlineMedium!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontSize: 21),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Post',
                                    style: themeData.textTheme.bodySmall!
                                        .copyWith(
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '250',
                                  style: themeData.textTheme.headlineMedium!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          fontSize: 21),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Following',
                                  style: themeData.textTheme.bodySmall!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5K',
                                  style: themeData.textTheme.headlineMedium!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          fontSize: 21),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Followers',
                                  style: themeData.textTheme.bodySmall!
                                      .copyWith(
                                          color:
                                              themeData.colorScheme.onPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onSurface
                                .withOpacity(0.1))
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 16, 24, 12),
                        child: Row(children: [
                          Expanded(
                              child: Text(
                            'My Posts',
                            style: themeData.textTheme.headlineMedium,
                          )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.square_grid_2x2,
                                color: themeData.colorScheme.primary,
                              )),
                          RotatedBox(
                            quarterTurns: 2,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.list_dash,
                                )),
                          )
                        ]),
                      ),
                      for (var i = 0; posts.length > i; i++)
                        Posts(post: posts[i])
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
