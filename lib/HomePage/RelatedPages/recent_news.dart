import 'package:flutter/material.dart';

class RecentNews extends StatefulWidget {
  const RecentNews({Key? key}) : super(key: key);

  @override
  State<RecentNews> createState() => _RecentNewsState();
}

class _RecentNewsState extends State<RecentNews> {
  List<bool> isExpandedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          _buildListTile(
            image: 'images/blog.png',
            title: 'Unleashing the Power of Flutter: A Comprehensive Guide',
            description:
                'In the ever-evolving landscape of mobile app development,'
                ' developers are constantly seeking tools that not only streamline the process but'
                ' also deliver exceptional performance and a delightful user experience.'
                ' Enter Flutter, an open-source UI software development toolkit created by Google.'
                ' Flutter has been gaining immense popularity for'
                ' its ability to build natively compiled applications for mobile,'
                ' web, and desktop from a single codebase.',
            postType: 'Article',
            postedDate: 'Posted on 05 Jan 2024',
            index: 0,
          ),
          const Divider(),
          _buildListTile(
            image: 'images/group.png',
            title: 'Title 2',
            description: 'Description goes here.'
                ' also deliver exceptional performance and a delightful user experience.'
                ' Enter Flutter, an open-source UI software development toolkit created by Google.'
                ' Flutter has been gaining immense popularity for'
                ' its ability to build natively compiled applications for mobile,'
                ' web, and desktop from a single codebase.',
            postType: 'General Post',
            postedDate: 'Posted on 05 Jan 2024',
            index: 1,
          ),
          const Divider(),
          _buildListTile(
            image: 'images/all.png',
            title: 'Title 3',
            description: 'Description goes here.'
                ' also deliver exceptional performance and a delightful user experience.'
                ' Enter Flutter, an open-source UI software development toolkit created by Google.'
                ' Flutter has been gaining immense popularity for'
                ' its ability to build natively compiled applications for mobile,'
                ' web, and desktop from a single codebase.',
            postType: 'Emergency',
            postedDate: 'Posted on 05 Jan 2024',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String image,
    required String title,
    required String description,
    required String postType,
    required String postedDate,
    required int index,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      onTap: () {
        setState(() {
          isExpandedList[index] = !isExpandedList[index];
        });
      },
      title: Row(
        children: [
          Image.asset(
            image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      subtitle: isExpandedList[index]
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _getPostTypeIcon(postType),
                    const SizedBox(width: 8),
                    Text(
                      postType,
                      style: TextStyle(
                        color: _getPostTypeColor(postType),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const Spacer(),
                    Text(
                      postedDate,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )
          : Container(),
      trailing: Icon(
        isExpandedList[index]
            ? Icons.keyboard_arrow_up
            : Icons.keyboard_arrow_down,
      ),
    );
  }

  Widget _getPostTypeIcon(String postType) {
    IconData iconData;
    switch (postType.toLowerCase()) {
      case 'article':
        iconData = Icons.library_books;
        break;
      case 'emergency':
        iconData = Icons.warning;
        break;
      case 'general post':
        iconData = Icons.info;
        break;
      default:
        iconData = Icons.error;
    }

    return Icon(
      iconData,
      color: _getPostTypeColor(postType),
    );
  }

  Color _getPostTypeColor(String postType) {
    switch (postType.toLowerCase()) {
      case 'article':
        return Colors.blue;
      case 'emergency':
        return Colors.red;
      case 'general post':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
