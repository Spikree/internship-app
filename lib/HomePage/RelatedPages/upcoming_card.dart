import 'package:flutter/material.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.cyan.shade500,
        borderRadius: BorderRadius.circular(18),
      ),
      child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                  Text(
                    'Welcome Name',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.brown.shade600,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,

                    ),
                ),
                SizedBox(width: 10),
                  Text(
                    'abc@xyz.com',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildItem(Icons.border_all_sharp, 'All'),
                _buildItem(Icons.emergency_outlined, 'Emergency'),
                _buildItem(Icons.warning_amber_outlined, 'Help'),
                _buildItem(Icons.indeterminate_check_box_rounded, 'News Post'),
              ],
            ),
          ],
        ),
      )

    );
  }

  Widget _buildItem(IconData icon, String label) {
    return InkWell(
      onTap: () {
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.white.withOpacity(0.5),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}





