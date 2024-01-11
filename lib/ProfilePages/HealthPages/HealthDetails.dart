import 'package:details/ProfilePages/HealthPages/HealthCheckUp.dart';
import 'package:details/ProfilePages/HealthPages/medical_history.dart';
import 'package:details/ProfilePages/HealthPages/vaccination_records.dart';
import 'package:details/personal.dart';
import 'package:flutter/material.dart';

import '../../HomePage/home_page.dart';
import '../../HomePage/profile.dart';
import '../FamilyDetails.dart';
import '../HealthInsurance.dart';
import '../address.dart';

class HealthDetails extends StatefulWidget {
  const HealthDetails({super.key});

  @override
  State<HealthDetails> createState() => _HealthDetails();
}

class _HealthDetails extends State<HealthDetails>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'Profile') {
                  Navigator.pushNamed(context, "/Login");
                } else if (value == 'Change Password') {
                  Navigator.pushNamed(context, "/changepassword");
                } else if (value == 'Logout') {
                  Navigator.pushNamed(context, "/");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Home',
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Change Password',
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Change Password'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ),
              ],
              icon: const Icon(Icons.person),
            ),
          ],
          backgroundColor: Colors.black,
          title: SafeArea(
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'images/logo_vishwa.png',
                    width: 35,
                  ),
                  const SizedBox(width: 3),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vishwakarma Group (VG) Vishwa',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Rahul'),
                accountEmail: Text('email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/user.png'),
                ),
              ),
              ListTile(
                title: const Text(
                  'Personal',
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Photo'),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => PhotoPage()),
                  // );
                },
              ),
              ListTile(
                title: const Text('Emergency Contact'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Emergency()),
                  // );
                },
              ),
              ListTile(
                title: const Text('Address'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Address()),
                  );
                },
              ),
              ListTile(
                title: const Text('Family details'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FamilyDetails()),
                  );
                },
              ),
              ListTile(
                title: const Text('Health details'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HealthDetails()),
                  );
                },
              ),
              ListTile(
                title: const Text('Health Insurance'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HealthInsurance()),
                  );
                },
              ),
              ListTile(
                title: const Text('Journey @ VI group'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                dividerColor: Colors.purple,
                indicatorColor: Colors.blueGrey,
                tabs: const [
                  Tab(text: 'Medical History'),
                  Tab(text: 'Vaccination Records'),
                  Tab(text: 'Health Checkup'),
                  Tab(text: 'Medical Examinations'),
                  Tab(text: 'Fitness and Lifestyle'),
                  Tab(text: 'Healthcare Provider'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const MedicalHistory(),
                    const VaccinationRecords(),
                    const HealthCheckUp(),
                    Container(color: Colors.indigo),
                    Container(color: Colors.indigo),
                    Container(color: Colors.indigo),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
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
            if (_selectedIndex == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }
          },
        ),
      ),
    );
  }
}
