import 'package:details/HomePage/home_page.dart';
import 'package:flutter/material.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({super.key});

  @override
  State<FamilyDetails> createState() => _FamilyDetails();
}

class FamilyMembers {
  late final String name;
  late String relation;
  late final String dateOfBirth;

  FamilyMembers(
      {required this.name, required this.relation, required this.dateOfBirth});
}

class _FamilyDetails extends State<FamilyDetails> {
  int? _selectedIndex = 2;
  final List<FamilyMembers> familyMembers = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool isDateFormatValid(String input) {
    final RegExp regex = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    return regex.hasMatch(input);
  }

  void _deleteFamilyMember(int index) {
    setState(() {
      familyMembers.removeAt(index);
    });
  }

  void _showAddFamilyMemberDialog() {
    final List<String> relations = [
      'Father',
      'Mother',
      'Brother',
      'Sister',
      'Spouse',
      'Child'
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add Family Member Details',
            style: TextStyle(
                fontSize: 20,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(
                    label: 'Name',
                    prefixIcon: Icons.person,
                    controller: nameController,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Relation',
                    prefixIcon: Icons.family_restroom,
                    controller: relationController,
                    dropdownItems: relations,
                    onChanged: (newValue) {
                      setState(() {
                        relationController.text = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'DOB',
                    prefixIcon: Icons.calendar_month_rounded,
                    controller: dobController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 12),
                  const Text("Enter date in DD-MM-YYYY format")
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearControllers();
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: _saveFamilyMember,
              child: const Text('Save', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    ).then((value) {
      setState(() {});
    });
  }

  void _editFamilyMember(int index) {
    nameController.text = familyMembers[index].name;
    relationController.text = familyMembers[index].relation;
    dobController.text = familyMembers[index].dateOfBirth;
    final List<String> relations = [
      'Father',
      'Mother',
      'Brother',
      'Sister',
      'Spouse',
      'Child'
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Edit Family Member Details',
            style: TextStyle(
                fontSize: 20,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(
                    label: 'Name',
                    prefixIcon: Icons.person,
                    controller: nameController,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Relation',
                    prefixIcon: Icons.family_restroom,
                    controller: relationController,
                    dropdownItems: relations,
                    onChanged: (newValue) {
                      setState(() {
                        relationController.text = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'DOB',
                    prefixIcon: Icons.calendar_month_rounded,
                    controller: dobController,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  const Text("Enter date in DD-MM-YYYY format")
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearControllers();
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                _updateFamilyMember(index);
              },
              child:
                  const Text('Update', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    ).then((value) {
      setState(() {});
    });
  }

  Widget _buildTextField({
    required String label,
    required IconData prefixIcon,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
    List<String>? dropdownItems,
  }) {
    return SizedBox(
      width: double.infinity,
      child: dropdownItems != null
          ? DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(prefixIcon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              value: dropdownItems.contains(controller.text)
                  ? controller.text
                  : dropdownItems.first, // Provide a default value if needed
              onChanged:
                  onChanged != null ? (newValue) => onChanged(newValue!) : null,
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          : TextField(
              decoration: InputDecoration(
                labelText: label,
                prefixIcon: Icon(prefixIcon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              controller: controller,
              onChanged: onChanged,
            ),
    );
  }

  void _clearControllers() {
    nameController.clear();
    relationController.clear();
    dobController.clear();
  }

  void _saveFamilyMember() {
    if (nameController.text.isNotEmpty &&
        relationController.text.isNotEmpty &&
        isDateFormatValid(dobController.text)) {
      setState(() {
        familyMembers.add(
          FamilyMembers(
            name: nameController.text,
            relation: relationController.text,
            dateOfBirth: dobController.text,
          ),
        );
      });
      _clearControllers();
      Navigator.of(context).pop();
    }
  }

  void _updateFamilyMember(int index) {
    if (nameController.text.isNotEmpty &&
        relationController.text.isNotEmpty &&
        isDateFormatValid(dobController.text)) {
      setState(() {
        familyMembers[index] = FamilyMembers(
          name: nameController.text,
          relation: relationController.text,
          dateOfBirth: dobController.text,
        );
      });
      _clearControllers();
      Navigator.of(context).pop();
    }
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
                accountName: Text('Mihir Patwardhan'),
                accountEmail: Text('mihir@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images'),
                ),
              ),
              const ListTile(
                title: Text(
                  'Personal',
                ),
                // onTap: () {Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PersonalDetails()),
                // );},
              ),
              const ListTile(
                title: Text('Photo'),
                // onTap: () {
                //   Navigator.of(context).pop();
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => PhotoPage()),
                //   );
                // },
              ),
              ListTile(
                title: const Text('Emergency Contact'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Address'),
                onTap: () {},
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
                onTap: () {},
              ),
              ListTile(
                title: const Text('Health Insurance'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Journey @ VI group'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('images/back_two.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 65),
                      Text(
                        'Family Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(children: [
                        Text('Enter You Relevant Details.',
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                      ]),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Relation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date Of Birth',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Action',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: familyMembers
                              .asMap()
                              .entries
                              .map(
                                (entry) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        entry.value.name,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        entry.value.relation,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        entry.value.dateOfBirth,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    DataCell(
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              _editFamilyMember(entry.key);
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {
                                              _deleteFamilyMember(entry.key);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddFamilyMemberDialog();
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
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
          currentIndex: _selectedIndex ?? 0,
          selectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              if (_selectedIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            });
          },
        ),
      ),
    );
  }
}
