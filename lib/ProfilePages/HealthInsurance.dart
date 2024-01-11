import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../HomePage/home_page.dart';
import 'FamilyDetails.dart';
import 'HealthPages/HealthDetails.dart';

class HealthInsurance extends StatefulWidget {
  const HealthInsurance({Key? key}) : super(key: key);

  @override
  State<HealthInsurance> createState() => _HealthInsuranceState();
}

class HealthInsuranceModel {
  final String policyNumber;
  final String policyProvider;
  final String fromDate;
  final String toDate;
  final String details;
  File? pdfFile;

  HealthInsuranceModel({
    required this.policyNumber,
    required this.policyProvider,
    required this.fromDate,
    required this.toDate,
    required this.details,
    required this.pdfFile,
  });
}

class _HealthInsuranceState extends State<HealthInsurance> {
  int? _selectedIndex = 2;
  File? pdfFile;

  final List<HealthInsuranceModel> healthDetailsList = [];

  TextEditingController policyNumberController = TextEditingController();
  TextEditingController policyProviderController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void _saveHealthDetails() {
    if (policyNumberController.text.isNotEmpty &&
        policyProviderController.text.isNotEmpty &&
        fromDateController.text.isNotEmpty &&
        toDateController.text.isNotEmpty &&
        detailsController.text.isNotEmpty) {
      setState(() {
        healthDetailsList.add(
          HealthInsuranceModel(
            policyNumber: policyNumberController.text,
            policyProvider: policyProviderController.text,
            fromDate: fromDateController.text,
            toDate: toDateController.text,
            details: detailsController.text,
            pdfFile: pdfFile,
          ),
        );
      });

      // Clear controllers and reset PDF file
      policyNumberController.clear();
      policyProviderController.clear();
      fromDateController.clear();
      toDateController.clear();
      detailsController.clear();
      pdfFile = null;

      Navigator.of(context).pop();
    }
  }

  Future<void> _selectPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != DateTime.now()) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  void _showAddHealthDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Health Details'),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: policyNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Policy Number',
                      prefixIcon: const Icon(Icons.assignment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: policyProviderController,
                    decoration: InputDecoration(
                      labelText: 'Policy Provider',
                      prefixIcon: const Icon(Icons.assignment_ind),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: fromDateController,
                          onTap: () => _selectDate(fromDateController),
                          decoration: InputDecoration(
                            labelText: 'From Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: toDateController,
                          onTap: () => _selectDate(toDateController),
                          decoration: InputDecoration(
                            labelText: 'To Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: detailsController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Details',
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Upload Documents"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _selectPdfFile();
                    },
                    child: Text(pdfFile == null
                        ? 'Select PDF File'
                        : 'PDF File Selected'),
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
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: _saveHealthDetails,
              child: const Text('Save', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _editHealthDetails(int index) {
    policyNumberController.text = healthDetailsList[index].policyNumber;
    policyProviderController.text = healthDetailsList[index].policyProvider;
    fromDateController.text = healthDetailsList[index].fromDate;
    toDateController.text = healthDetailsList[index].toDate;
    detailsController.text = healthDetailsList[index].details;
    pdfFile = healthDetailsList[index].pdfFile;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Health Details'),
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: policyNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Policy Number',
                      prefixIcon: const Icon(Icons.assignment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: policyProviderController,
                    decoration: InputDecoration(
                      labelText: 'Policy Provider',
                      prefixIcon: const Icon(Icons.assignment_ind),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: fromDateController,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            _selectDate(fromDateController);
                          },
                          decoration: InputDecoration(
                            labelText: 'From Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: toDateController,
                          onTap: () {
                            _selectDate(toDateController);
                          },
                          decoration: InputDecoration(
                            labelText: 'To Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: detailsController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Details',
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Upload Documents"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _selectPdfFile();
                    },
                    child: Text(pdfFile == null
                        ? 'Select PDF File'
                        : 'PDF File Selected'),
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
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                if (policyNumberController.text.isNotEmpty &&
                    policyProviderController.text.isNotEmpty &&
                    fromDateController.text.isNotEmpty &&
                    toDateController.text.isNotEmpty &&
                    detailsController.text.isNotEmpty) {
                  setState(() {
                    healthDetailsList[index] = HealthInsuranceModel(
                      policyNumber: policyNumberController.text,
                      policyProvider: policyProviderController.text,
                      fromDate: fromDateController.text,
                      toDate: toDateController.text,
                      details: detailsController.text,
                      pdfFile: pdfFile,
                    );
                  });

                  policyNumberController.clear();
                  policyProviderController.clear();
                  fromDateController.clear();
                  toDateController.clear();
                  detailsController.clear();

                  Navigator.of(context).pop();
                }
              },
              child:
                  const Text('Update', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(30)),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 65),
                    Text(
                      'Health Insurance Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Enter Valid Data.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 85),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Flexible(
                        child: DataTable(
                          headingTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          columns: [
                            const DataColumn(
                              label: Text(
                                'Policy Number',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                'Policy Provider',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                'From Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                'To Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                'Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(
                            healthDetailsList.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    healthDetailsList[index].policyNumber,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    healthDetailsList[index].policyProvider,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    healthDetailsList[index].fromDate,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    healthDetailsList[index].toDate,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    healthDetailsList[index].details,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          _editHealthDetails(index);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            healthDetailsList.removeAt(index);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHealthDetailsDialog,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName:
                  Text('Rahul Chauhan', style: TextStyle(color: Colors.white)),
              accountEmail: Text(
                'rahul@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.black),
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
            ListTile(title: const Text('Photo'), onTap: () {}
                // {
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
    );
  }
}
