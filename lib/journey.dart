import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Journey(),
      ),
    );

class Journey extends StatefulWidget {
  const Journey({super.key});

  @override
  State<Journey> createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
  final _addFormKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  List<Map<String, String>> tableData = [];
  int srNo = 1;
  int? _selectedIndex = 0;
  DateTime? _fromDate;
  String? fromDateError;
  DateTime? _toDate;
  String? toDateError;
  bool isCurrentlyWorking = false;

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController orginizationController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();
  TextEditingController activitiesController = TextEditingController();
  TextEditingController isCurrentlyWorkingController = TextEditingController();

  String designation = 'CEO';
  List<String> designationOptions = [
    'CEO',
    'professor',
    'Assistant professor',
    'product head',
    'Other'
  ];

  void addRow(
    String organization,
    String jobRole,
    String activities,
  ) {
    setState(() {
      tableData.add({
        'Sr. No': srNo.toString(),
        'Organization': organization,
        'Designation': designation,
        'Job Role': jobRole,
        'Activities': activities,
      });
      srNo++;
    });
  }

  void editRow(int index, String name, String designation, String contact) {
    setState(() {
      tableData[index] = {
        'Sr. No': tableData[index]['Sr. No']!,
        'Name': name,
        'Relationship': designation,
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
                      'Journey @ VG vishwa',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showAddDialog();
                            },
                            child: Text('Add Row'),
                          ),
                        ),
                      ],
                    )
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
                        columns: [
                          DataColumn(label: Text('Sr. No')),
                          DataColumn(label: Text('Organization')),
                          DataColumn(label: Text('Designation')),
                          DataColumn(label: Text('Job Role')),
                          DataColumn(label: Text('From date')),
                          DataColumn(label: Text('To date')),
                          DataColumn(label: Text('Activities')),
                          DataColumn(
                              label: Text(
                                  'Is currently working in the organization')),
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
                                      Text(entry.value['Organization'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Designation'] ?? '')),
                                  DataCell(Text(entry.value['Job Role'] ?? '')),
                                  DataCell(
                                      Text(entry.value['From date'] ?? '')),
                                  DataCell(Text(entry.value['To date'] ?? '')),
                                  DataCell(
                                      Text(entry.value['Activities'] ?? '')),
                                  DataCell(Text(entry.value[
                                          'Is currently working in the organization'] ??
                                      '')),
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
                    controller: orginizationController,
                    decoration: InputDecoration(
                      labelText: 'Organization',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a organization name';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField(
                    value: designation,
                    items: designationOptions.map((String relationship) {
                      return DropdownMenuItem(
                        value: relationship,
                        child: Text(relationship),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        designation = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Designation',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your designation';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: jobRoleController,
                    decoration: InputDecoration(
                      labelText: 'Job role',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your job role';
                      }
                      if (value.length != 10) {
                        return 'Please enter your job role';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null && pickedDate != _fromDate) {
                          setState(() {
                            _fromDate = pickedDate;
                            fromDateController.text = _fromDate.toString();
                          });
                        }
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: fromDateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black87,
                            ),
                            hintText: "From date",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: fromDateError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length > 10 ||
                                value.length < 10) {
                              setState(() {
                                fromDateError = 'please select a date';
                              });
                              return 'Please select a date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null && pickedDate != _toDate) {
                          setState(() {
                            _toDate = pickedDate;
                            toDateController.text = _toDate.toString();
                          });
                        }
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: fromDateController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black87,
                            ),
                            hintText: "To date",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: fromDateError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length > 10 ||
                                value.length < 10) {
                              setState(() {
                                fromDateError = 'please select a date';
                              });
                              return 'Please select a date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: activitiesController,
                    decoration: InputDecoration(
                      labelText: 'Activities',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your activity';
                      }
                      if (value.length != 10) {
                        return 'Please enter your activity';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  Checkbox(
                    value: isCurrentlyWorking,
                    onChanged: (bool? value) {
                      setState(() {
                        isCurrentlyWorking = value!;
                      });
                    },
                  ),
                  Text('Is currently working in the orginization')
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
                    designation,
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
                  value: designation,
                  items: designationOptions.map((String designation) {
                    return DropdownMenuItem(
                      value: designation,
                      child: Text(designation),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      designation = value!;
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
                    designation,
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

  // Widget customSwitch(String text, bool val, Function onChangeMethod) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           text,
  //           style: TextStyle(
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.w600,
  //               color: Colors.black),
  //         ),
  //         Spacer(),
  //         CupertinoSwitch(
  //             trackColor: Colors.grey,
  //             activeColor: Colors.blue,
  //             value: val,
  //             onChanged: (newValue) {
  //               onChangeMethod(newValue);
  //             })
  //       ],
  //     ),
  //   );
  // }
}
