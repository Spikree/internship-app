import 'package:flutter/material.dart';

class CoorDinators extends StatefulWidget {
  const CoorDinators({Key? key}) : super(key: key);

  @override
  State<CoorDinators> createState() => _CoorDinatorsState();
}

class _CoorDinatorsState extends State<CoorDinators> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordinators'),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildExpandableCard(
              title: 'Vishwakarma Institute Of Technology(VIT), Pune',
              items: [
                _buildExpansionTile(
                  title: 'Prof. Dr. Chandrashekhar Mahajan',
                  email: 'chandrashekhar@vit.edu',
                  number: '+9184848484848',
                ),
                _buildExpansionTile(
                  title: 'Prof. Dr.  Ashutosh Kulkarni',
                  email: 'ashutosh@vit.edu',
                  number: '+9183838833333',
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildExpandableCard(
              title: 'Vishwakarma University(VU)',
              items: [
                _buildExpansionTile(
                  title: 'Coordinator Name 3',
                  email: 'coordinator3@example.com',
                  number: '+91232322323',
                ),
                _buildExpansionTile(
                  title: 'Coordinator Name 4',
                  email: 'coordinator4@example.com',
                  number: '+919999999999',
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildExpandableCard(
              title: 'Wisdom World School(WWS),Wakad',
              items: [
                _buildExpansionTile(
                  title: 'Coordinator Name 5',
                  email: 'coordinator3@example.com',
                  number: '+91232322323',
                ),
                _buildExpansionTile(
                  title: 'Coordinator Name 5',
                  email: 'coordinator4@example.com',
                  number: '+919999999999',
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildExpandableCard(
              title: 'Group 2',
              items: [
                _buildExpansionTile(
                  title: 'Coordinator Name 4',
                  email: 'coordinator3@example.com',
                  number: '+91232322323',
                ),
                _buildExpansionTile(
                  title: 'Coordinator Name 4',
                  email: 'coordinator4@example.com',
                  number: '+919999999999',
                ),
              ],
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

  Widget _buildExpandableCard({
    required String title,
    required List<Widget> items,
  }) {
    return Card(
      elevation: 5.0,
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: items,
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required String email,
    required String number,
  }) {
    return Card(
      elevation: 5.0,
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/user.png'),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          _buildInfoRow('Email', email),
          _buildInfoRow('Phone', number),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(value),
    );
  }
}
