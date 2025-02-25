import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/blurry_animated_container.dart';
import 'package:my_portfolio/content.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:zo_animated_border/zo_animated_border.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double gap = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400),
          child: Stack(
            children: [
              ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  children: [
                    Gap(100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedTextKit(
                              repeatForever: false,
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  "Darshan Paccha",
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!,
                                  colors: [
                                    Colors.white,
                                    Colors.grey.shade900,

                                    // Color(0xFFFFFFFF), // Pure White
                                    // Color.fromARGB(
                                    //     255, 135, 135, 135), // Light Gray
                                    // Colors.grey.shade900 // Black
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Text(
                                    "I'm a ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                  AnimatedTextKit(
                                    repeatForever: true,
                                    pause: Duration(seconds: 3),
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        'Flutter Developer',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      TypewriterAnimatedText(
                                        'Web Developer',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 48,
                        ),
                      ],
                    ),
                    Gap(gap),
                    Text(
                      'About',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(Content.about),
                    Gap(gap),
                    Text(
                      'Education',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Gap(5),
                    EducationCard(),
                    Gap(gap),
                    Text(
                      'Skills',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Gap(5),
                    Wrap(
                      children: List.generate(
                        Content.skills.length,
                        (index) => SkillCard(text: Content.skills[index]),
                      ),
                    ),
                    Gap(gap),
                    Text(
                      'Experience',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Gap(5),
                    SizedBox(
                      height: 150,
                      width: 500,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MyTimelineTile(
                            text: 'Hack Club VITC | Flutter Developer',
                            isDone: true,
                          ),
                          MyTimelineTile(
                            text: 'GDG | Web Developer',
                            isDone: true,
                          ),
                          MyTimelineTile(
                            text: 'GDG | Web Developer',
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                    Gap(100),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: MyBottomNavBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTimelineTile extends StatelessWidget {
  final String text;
  final bool isLast;
  final bool isDone;
  const MyTimelineTile({
    super.key,
    required this.text,
    this.isDone = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: Colors.white,
        thickness: 1,
      ),
      indicatorStyle: IndicatorStyle(
        height: 30,
        width: 30,
        indicator: Container(
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: isDone ? Colors.white : Colors.black,
            shape: CircleBorder(
              side: BorderSide(color: Colors.white, width: 1),
            ),
          ),
          child: Icon(
            Icons.check,
            color: isDone ? Colors.black : Colors.white,
            size: 12,
          ),
        ),
      ),
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.start,
      endChild: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 50, right: 50, top: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return ZoSnakeBorder(
      duration: 10,
      snakeHeadColor: Colors.white,
      snakeTailColor: Colors.grey,
      snakeTrackColor: Colors.grey.shade700,
      borderWidth: 2,
      borderRadius: BorderRadius.circular(30),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: BlurryAnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: isHovered ? 30 : 20,
            vertical: 10,
          ),
          blur: 30,
          elevation: 0,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyBottomNavItem(icon: FontAwesomeIcons.github),
              _buildDivider(),
              MyBottomNavItem(icon: FontAwesomeIcons.linkedin),
              _buildDivider(),
              MyBottomNavItem(icon: FontAwesomeIcons.instagram),
              _buildDivider(),
              MyBottomNavItem(icon: FontAwesomeIcons.envelope),
              _buildDivider(),
              MyBottomNavItem(icon: FontAwesomeIcons.moon),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBottomNavItem extends StatefulWidget {
  final IconData icon;
  const MyBottomNavItem({super.key, required this.icon});

  @override
  State<MyBottomNavItem> createState() => _MyBottomNavItemState();
}

class _MyBottomNavItemState extends State<MyBottomNavItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: isHovered ? 25 : 10),
        child: FaIcon(widget.icon, color: Colors.white, size: 24),
      ),
    );
  }
}

Widget _buildDivider() {
  return Container(
    width: 1,
    height: 20,
    color: Color.fromRGBO(255, 255, 255, 0.3),
  );
}

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vellore Institute of Technology',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text('BTech CSE'),
          ],
        ),
        Spacer(),
        Text('2023-2027'),
      ],
    );
  }
}

class SkillCard extends StatefulWidget {
  final String text;
  const SkillCard({super.key, required this.text});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        decoration: BoxDecoration(
          border: isHovered
              ? Border.all(color: Theme.of(context).colorScheme.primary)
              : Border.all(color: Theme.of(context).colorScheme.secondary),
          color: isHovered
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
