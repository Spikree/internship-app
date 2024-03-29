import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EmergencyDetails(),
      ),
    );

class EmergencyDetails extends StatefulWidget {
  const EmergencyDetails({super.key});

  @override
  State<EmergencyDetails> createState() => _EmergencyDetailsState();
}

class _EmergencyDetailsState extends State<EmergencyDetails> {
  final _addFormKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  List<Map<String, String>> tableData = [];
  int srNo = 1;
  int? _selectedIndex = 0;

  String selectedRelationship = 'Friend';
  List<String> relationshipOptions = [
    'Spouse',
    'Parent',
    'Sibling',
    'Friend',
    'Other'
  ];

  void addRow(String name, String relationship, String contact) {
    setState(() {
      tableData.add({
        'Sr. No': srNo.toString(),
        'Name': name,
        'Relationship': relationship,
        'Contact': contact,
      });
      srNo++;
    });
  }

  void editRow(int index, String name, String relationship, String contact) {
    setState(() {
      tableData[index] = {
        'Sr. No': tableData[index]['Sr. No']!,
        'Name': name,
        'Relationship': relationship,
        'Contact': contact,
      };
    });
  }

  void deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    const Text(
                      'VG Vishwa',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Emergency Details',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Sr. No')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Relationship')),
                          DataColumn(label: Text('Contact')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: tableData
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  DataCell(Text(entry.value['Sr. No'] ?? '')),
                                  DataCell(Text(entry.value['Name'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Relationship'] ?? '')),
                                  DataCell(Text(entry.value['Contact'] ?? '')),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            showEditDialog(entry.key);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            deleteRow(entry.key);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: FloatingActionButton(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.add),
                            onPressed: () {
                              showAddDialog();
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
        currentIndex: _selectedIndex ?? 0,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (_selectedIndex == 2) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfileSection()),
              // );
            }
          });
        },
      ),
    );
  }

  void showAddDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController contactController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Row'),
          content: Form(
            key: _addFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField(
                    value: selectedRelationship,
                    items: relationshipOptions.map((String relationship) {
                      return DropdownMenuItem(
                        value: relationship,
                        child: Text(relationship),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedRelationship = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Relationship',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a relationship';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: contactController,
                    decoration: InputDecoration(
                      labelText: 'Contact',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a contact number';
                      }
                      if (value.length != 10) {
                        return 'Please enter a 10-digit number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_addFormKey.currentState!.validate()) {
                  addRow(
                    nameController.text,
                    selectedRelationship,
                    contactController.text,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void showEditDialog(int index) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController contactController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Row'),
          content: Form(
            key: _editFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  value: selectedRelationship,
                  items: relationshipOptions.map((String relationship) {
                    return DropdownMenuItem(
                      value: relationship,
                      child: Text(relationship),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedRelationship = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Relationship',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please select a relationship';
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a contact number';
                    }
                    if (value.length != 10) {
                      return 'Please enter a 10-digit number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_editFormKey.currentState!.validate()) {
                  editRow(
                    index,
                    nameController.text,
                    selectedRelationship,
                    contactController.text,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
