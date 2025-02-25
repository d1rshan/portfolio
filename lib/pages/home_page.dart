import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/blurry_animated_container.dart';
import 'package:my_portfolio/content.dart';

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
                            Text(
                              "Hi, I'm Darshan 👋",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              "Flutter Developer | Web Developer",
                              style: Theme.of(context).textTheme.headlineMedium,
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

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return ZoAnimatedGradientBorder(
      glowOpacity: 0.1,
      borderRadius: 30,
      borderThickness: 2,
      shouldAnimate: true,
      gradientColor: [
        Colors.grey.shade700,
        Colors.white,
      ],
      duration: Duration(seconds: 5),
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
              horizontal: isHovered ? 30 : 20, vertical: 10),
          blur: 10,
          elevation: 0,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyBottomNavItem(icon: Icons.home),
              _buildDivider(),
              MyBottomNavItem(icon: Icons.code),
              _buildDivider(),
              MyBottomNavItem(icon: Icons.business),
              _buildDivider(),
              MyBottomNavItem(icon: Icons.email),
              _buildDivider(),
              MyBottomNavItem(icon: Icons.nightlight),
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
        child: Icon(widget.icon, color: Colors.white, size: 28),
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
