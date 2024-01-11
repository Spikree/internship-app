import 'package:details/HomePage/home_page.dart';
import 'package:details/ProfilePages/FamilyDetails.dart';
import 'package:details/ProfilePages/HealthInsurance.dart';
import 'package:details/ProfilePages/HealthPages/HealthDetails.dart';
import 'package:details/ProfilePages/address.dart';
import 'package:details/emergencyDetails.dart';
import 'package:flutter/material.dart';

import '../forgot_pass.dart';

class ProfileSection extends StatelessWidget {
  final int _selectedIndex = 2;
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
                } else if (value == 'logout') {
                  // Handle logout
                }
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Center(
                child: Text(
                  'Personal',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.photo, color: Colors.white),
              title: const Center(
                child: Text(
                  'Photo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.phone, color: Colors.white),
              title: const Center(
                child: Text(
                  'Emergency Contact',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmergencyDetails(),
                    ));
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.location_on, color: Colors.white),
              title: const Center(
                child: Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Address(),
                    ));
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.group, color: Colors.white),
              title: const Center(
                child: Text(
                  'Family Details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FamilyDetails(),
                    ));
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Center(
                child: Text(
                  'Health Details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HealthDetails(),
                    ));
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.local_hospital, color: Colors.white),
              title: const Center(
                child: Text(
                  'Health Insurance',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HealthInsurance()));
              },
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.cyan.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.white),
              ),
              leading: const Icon(Icons.directions_bus, color: Colors.white),
              title: const Center(
                child: Text(
                  'Journey @VI Group',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
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
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (index == 1) {
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileSection()));
          }
        },
      ),
    );
  }
}
