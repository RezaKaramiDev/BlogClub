// ignore_for_file: file_names, non_constant_identifier_names

import 'package:blog_club/article.dart';
import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Kevin!',
                      style: themeData.textTheme.titleLarge,
                    ),
                    Assets.img.icons.notification.image(width: 32, height: 32)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headlineLarge,
                ),
              ),
              _StoryList(),
              const SizedBox(
                height: 16,
              ),
              _CategoryList(),
              _PostList(),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          padding: const EdgeInsets.fromLTRB(26, 2, 26, 0),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            final story = stories[index];
            return _Story(story: story);
          })),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          child: Stack(
            children: [
              story.isViewed ? _ProfileImageViewed() : _ProfileImageNormal(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          story.name,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  Widget _ProfileImageNormal() {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB)
          ])),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xffFBFCFF)),
        padding: const EdgeInsets.all(5),
        child: _ProfileImage(),
      ),
    );
  }

  Widget _ProfileImageViewed() {
    return SizedBox(
      height: 66,
      width: 66,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: const [6, 4],
        color: const Color(0xff7B8BB2),
        radius: const Radius.circular(24),
        child: Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(5),
          child: _ProfileImage(),
        ),
      ),
    );
  }

  Widget _ProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final categories = AppDatabase.categories;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: ((context, index, realIndex) {
          final category = categories[realIndex];
          return _CategoryItems(
            category: category,
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
          );
        }),
        options: CarouselOptions(
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            scrollPhysics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            initialPage: 0,
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true));
  }
}

class _CategoryItems extends StatelessWidget {
  final double left;
  final double right;
  const _CategoryItems({
    required this.category,
    required this.left,
    required this.right,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, 0, right, 20),
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: 65,
            left: 65,
            bottom: 5,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: Color(0xaa0D253C), blurRadius: 20)
              ]),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(4, 2, 4, 8),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color(0xff0D253C), Colors.transparent])),
              decoration: BoxDecoration(
                  color: Colors.tealAccent.shade400,
                  borderRadius: BorderRadius.circular(32)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 48,
              left: 32,
              child: Text(category.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: Colors.white)))
        ],
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  final posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(38, 6, 24, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'More',
                    style: TextStyle(color: Color(0xff376AED)),
                  ))
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Posts(post: post);
            })
      ],
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0x1a5282ff), blurRadius: 10)
          ]),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ArticleScreen())),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/img/posts/small/${post.imageFileName}',
                  width: 120,
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ArticleScreen())),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.caption,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(post.title),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 4),
                        child: post.isLiked
                            ? const Icon(
                                CupertinoIcons.hand_thumbsup_fill,
                                color: Colors.redAccent,
                                size: 16,
                              )
                            : const Icon(
                                CupertinoIcons.hand_thumbsup,
                                size: 16,
                              ),
                      ),
                      Text(post.likes),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 4, 4),
                        child: Icon(
                          CupertinoIcons.clock,
                          size: 16,
                        ),
                      ),
                      Text(post.likes),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: post.isBookmarked
                              ? Icon(
                                  CupertinoIcons.bookmark_fill,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : const Icon(
                                  CupertinoIcons.bookmark,
                                  size: 16,
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
