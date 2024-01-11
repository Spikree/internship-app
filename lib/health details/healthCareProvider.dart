import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HealthCare(),
      ),
    );

class HealthCare extends StatefulWidget {
  const HealthCare({super.key});

  @override
  State<HealthCare> createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> {
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

  void addRow(
    String providerType,
    String nameOfDoctor,
    String nameOfHospital,
    String hospitalAddress,
    String hospitalContact,
    String specialization,
  ) {
    setState(() {
      tableData.add({
        'Sr. No': srNo.toString(),
        'provider Type': providerType,
        'Name of doctor': nameOfDoctor,
        'Name of hospital': nameOfHospital,
        'Hospital Address': hospitalAddress,
        'Hospital Contact': hospitalContact,
        'Specialization': specialization,
      });
      srNo++;
    });
  }

  void editRow(
    int index,
    String providerType,
    String nameOfDoctor,
    String nameOfHospital,
    String hospitalAddress,
    String hospitalContact,
    String specialization,
  ) {
    setState(() {
      tableData[index] = {
        'Sr. No': tableData[index]['Sr. No']!,
        'provider Type': providerType,
        'Name of doctor': nameOfDoctor,
        'Name of hospital': nameOfHospital,
        'Hospital Address': hospitalAddress,
        'Hospital Contact': hospitalContact,
        'Specialization': specialization,
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
                      'Health care provider',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Medical History'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Vaccination Records'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Health Checkup'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'medical');
                            },
                            child: Text('Medical Examinations'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'fitness');
                            },
                            child: Text('Fitness and Lifestyle'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'health');
                            },
                            child: Text('Healthcare Provider'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Sr. No')),
                          DataColumn(label: Text('Provider Type')),
                          DataColumn(label: Text('Doctor Name')),
                          DataColumn(label: Text('Hospital Name')),
                          DataColumn(label: Text('Hospital Address')),
                          DataColumn(label: Text('Hospital Contact')),
                          DataColumn(label: Text('Specialization')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: tableData
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  DataCell(Text(entry.value['Sr. No'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Provider Type'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Doctor Name'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Hospital name'] ?? '')),
                                  DataCell(Text(
                                      entry.value['Hospital Address'] ?? '')),
                                  DataCell(Text(
                                      entry.value['Hospital Contact'] ?? '')),
                                  DataCell(Text(
                                      entry.value['Specialization'] ?? '')),
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
                      nameController.text,
                      nameController.text,
                      nameController.text);
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
                    nameController.text,
                    nameController.text,
                    nameController.text,
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
