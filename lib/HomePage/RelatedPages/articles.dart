import 'package:flutter/material.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<CustomIcons> customIcons = [
    CustomIcons(icon: 'images/article.png', name: 'Article'),
    CustomIcons(icon: 'images/group.png', name: 'Members'),
    CustomIcons(icon: 'images/blog.png', name: 'Blog'),
    CustomIcons(icon: 'images/all.png', name: 'All'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Row(
          children: [
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4),
                  ),
                  child: Image.asset(customIcons[index].icon),
                ),
                const SizedBox(height: 6),
                Text(customIcons[index].name)
              ],
            ),
            const SizedBox(width: 10),
          ],
        );
      }),
    );
  }
}

class CustomIcons {
  final String icon;
  final String name;

  CustomIcons({
    required this.icon,
    required this.name,
  });
}
