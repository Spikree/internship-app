import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MedicalExamination(),
      ),
    );

class MedicalExamination extends StatefulWidget {
  const MedicalExamination({super.key});

  @override
  State<MedicalExamination> createState() => _MedicalExaminationState();
}

class _MedicalExaminationState extends State<MedicalExamination> {
  final _addFormKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController docUploadedController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  List<Map<String, String>> tableData = [];
  int srNo = 1;
  int? _selectedIndex = 0;
  DateTime? _date;
  String? dateError;

  void clear() {
    setState(() {
      dateController.clear();
      docUploadedController.clear();
      commentController.clear();
    });
  }

  void openFiles() async {
    docUploadedController.text = 'not uploaded';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      docUploadedController.text = 'uploaded';
    } else {
      docUploadedController.text = 'not uploaded';
    }
  }

  String selectedRelationship = 'Friend';
  List<String> relationshipOptions = [
    'Spouse',
    'Parent',
    'Sibling',
    'Friend',
    'Other'
  ];

  void addRow(String date, String document, String comment) {
    setState(() {
      tableData.add({
        'Sr. No': srNo.toString(),
        'Date': date,
        'Document': document,
        'Comment': comment,
      });
      srNo++;
    });
  }

  void editRow(int index, String date, String document, String comment) {
    setState(() {
      tableData[index] = {
        'Sr. No': tableData[index]['Sr. No']!,
        'Date': date,
        'Relationship': document,
        'Contact': comment,
      };
    });
  }

  void deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
    });
    srNo--;
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
                      'Medical Examination',
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
                            onPressed: null,
                            child: Text('Medical Examinations'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text('Fitness and Lifestyle'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: null,
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
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Document')),
                          DataColumn(label: Text('Comment')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: tableData
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  DataCell(Text(entry.value['Sr. No'] ?? '')),
                                  DataCell(Text(entry.value['Date'] ?? '')),
                                  DataCell(Text(entry.value['Document'] ?? '')),
                                  DataCell(Text(entry.value['Comment'] ?? '')),
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
                              docUploadedController.text = 'not uploaded';
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

                        if (pickedDate != null && pickedDate != _date) {
                          setState(() {
                            _date = pickedDate;

                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(_date!);
                          });
                        }
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black87,
                            ),
                            hintText: "Date",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: dateError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                dateError = 'please select a date';
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
                  ElevatedButton(
                    onPressed: openFiles,
                    child: Text('Upload document'),
                  ),
                  TextFormField(
                    controller: commentController,
                    decoration: InputDecoration(
                      labelText: 'Comment',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a comment';
                      }

                      return null;
                    },
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
              onPressed: () async {
                if (_addFormKey.currentState!.validate()) {
                  addRow(
                    dateController.text,
                    docUploadedController.text,
                    commentController.text,
                  );
                  clear();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
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

                        if (pickedDate != null && pickedDate != _date) {
                          setState(() {
                            _date = pickedDate;

                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(_date!);
                          });
                        }
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black87,
                            ),
                            hintText: "Date",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: dateError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                dateError = 'please select a date';
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
                  ElevatedButton(
                    onPressed: openFiles,
                    child: Text('Upload document'),
                  ),
                  TextFormField(
                    controller: commentController,
                    decoration: InputDecoration(
                      labelText: 'Comment',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a comment';
                      }

                      return null;
                    },
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
                if (_editFormKey.currentState!.validate()) {
                  editRow(
                    index,
                    dateController.text,
                    docUploadedController.text,
                    commentController.text,
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

  Widget content() {
    return Center(
      child: GestureDetector(
        onTap: () {
          openFiles();
        },
        child: Container(
          width: 100,
          height: 50,
          color: Colors.lightBlue,
          child: Center(
              child: Text(
            'Upload document',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
