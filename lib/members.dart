import 'package:flutter/material.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordinators'),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Rahul Chauhan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Emp Code: 654321',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Email: a@x.com'),
                        Text('Designation: Coordinator'),
                        Text('Joining Date: February 1, 2022'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Second Card
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar on the left
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),

                    SizedBox(width: 16),

                    // Text on the right
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Asdddd',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Emp Code: 987654',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Email: bxxx@e.com'),
                        Text('Designation: Manager'),
                        Text('Joining Date: March 1, 2022'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Third Card
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar on the left
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),

                    SizedBox(width: 16),

                    // Text on the right
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: David Warner',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Emp Code: 789012',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Email: n@e.com'),
                        Text('Designation: Coordinator'),
                        Text('Joining Date: April 1, 2022'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade300,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink.shade600),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.pink.shade600),
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
        },
      ),
    );
  }
}
