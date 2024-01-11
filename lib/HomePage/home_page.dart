import 'dart:math';

import 'package:details/HomePage/RelatedPages/upcoming_card.dart';
import 'package:details/coordinators.dart';
import 'package:details/doctors.dart';
import 'package:details/emergencyTeam.dart';
import 'package:details/forgot_pass.dart';
import 'package:details/members.dart';
import 'package:details/profile.dart';
import 'package:flutter/material.dart';

import 'RelatedPages/articles.dart';
import 'RelatedPages/recent_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Image.asset('images/logo_vishwa.png', width: 35),
            const SizedBox(width: 18),
            const Text(
              "VG Vishwa",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_sharp),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'change_password',
                  child: Text('Change Password'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
              onSelected: (String value) {
                if (value == 'change_password') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()),
                  );
                } else if (value == 'logout') {}
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          UpComingCard(),
          SizedBox(
            height: 10,
          ),
          Text(
            "News",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Articles(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Recent Posts",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          RecentNews(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              accountName: Text('Rahul'),
              accountEmail: Text('rahul@gmail.com'),
            ),
            ListTile(
              title: const Text('News Posts'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Co-ordinators'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoorDinators(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Emergency Team'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmergencyTeam(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Members'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Members(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Doctors'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Doctors(),
                    ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade300,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.pink.shade600,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.pink.shade600,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink.shade600),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (_selectedIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileSection()),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan.shade800,
        onPressed: () {
          _showAddPostDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddPostDialog(BuildContext context) {
    String? postType = '';
    String title = '';
    String description = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Add Post',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDropdownField('Post Type', Icons.info,
                  ['Emergency', 'Regular', 'Important'], (value) {
                postType = value;
              }),
              const SizedBox(height: 10),
              _buildTextField('Title', Icons.title, (value) {
                title = value;
              }),
              const SizedBox(height: 10),
              _buildTextField('Description', Icons.description, (value) {
                description = value;
              }),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle the data (postType, title, description) here
                print('Post Type: $postType');
                print('Title: $title');
                print('Description: $description');

                // Add your logic to save the post
                // For now, let's just close the dialog
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
      String label, IconData prefixIcon, ValueChanged<String> onChanged) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownField(String label, IconData prefixIcon,
      List<String> items, void Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: const TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.black),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
