import 'package:flutter/material.dart';

import '../HomePage/home_page.dart';
import '../HomePage/profile.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  int _selectedIndex = 2;

  List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Chennai',
    'Kolkata',
    'Hyderabad',
    'Ahmedabad',
    'Pune',
    'Jaipur',
    'Surat'
  ];
  List<String> states = ['Maharashtra', 'Gujarat', 'Punjab'];
  String? addressError;
  String? pinCodeError;
  String? stateError;
  String? cityError;

  String copiedPermanentAddress = '';
  String copiedPermanentCity = '';
  String copiedPermanentState = '';
  String copiedPermanentPinCode = '';

  String? selectedLocalCity;
  String? selectedLocalState;
  String? selectedPermanentCity;
  String? selectedPermanentState;

  final TextEditingController copiedPermanentCityController =
      TextEditingController();
  final TextEditingController copiedPermanentStateController =
      TextEditingController();
  final TextEditingController copiedPermanentPinCodeController =
      TextEditingController();

  TextEditingController localAddressController = TextEditingController();
  TextEditingController localPinCodeController = TextEditingController();
  TextEditingController localCityController = TextEditingController();
  TextEditingController localStateController = TextEditingController();

  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController permanentPinCodeController = TextEditingController();
  TextEditingController permanentCityController = TextEditingController();
  TextEditingController permanentStateController = TextEditingController();

  bool copyToLocal = false;

  void copyLocalToPermanent() {
    setState(() {
      permanentAddressController.text = localAddressController.text;
      permanentPinCodeController.text = localPinCodeController.text;
      permanentCityController.text = localCityController.text;
      permanentStateController.text = localStateController.text;
      selectedPermanentCity = selectedLocalCity;
      selectedPermanentState = selectedLocalState;
    });
  }

  void saveData() {
    if (localAddressController.text.trim().isEmpty ||
        localPinCodeController.text.trim().isEmpty ||
        selectedLocalCity!.isEmpty ||
        selectedPermanentCity!.isEmpty ||
        selectedLocalState!.isEmpty ||
        selectedPermanentState!.isEmpty ||
        permanentAddressController.text.trim().isEmpty ||
        permanentPinCodeController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please fill in all the required fields."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Address Saved"),
            content: const Text("Your address has been saved successfully."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const FamilyDetails(),
                  //   ),
                  // );
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    copiedPermanentCityController.text = permanentCityController.text;
    copiedPermanentStateController.text = permanentStateController.text;
    copiedPermanentPinCodeController.text = permanentPinCodeController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
        backgroundColor: Colors.cyan,
        title: SafeArea(
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  'images/logo_vishwa.png',
                  height: 30,
                  width: 30,
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
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text('Rahul Chauhan'),
              accountEmail: Text('rahul@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images'),
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
                Navigator.of(context).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PhotoPage()),
                // );
              },
            ),
            ListTile(
              title: const Text('Emergency Contact'),
              onTap: () {},
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FamilyDetails()),
                // );
              },
            ),
            ListTile(
              title: const Text('Health details'),
              onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HealthDetails()),
                //   );
              },
            ),
            ListTile(
              title: const Text('Health Insurance'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HealthInsurance()),
                // );
              },
            ),
            ListTile(
              title: const Text('Journey @ VI group'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade500,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(30),
                          top: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 65),
                        Text(
                          'Location Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(children: [
                          Text('Enter Your Address.',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                        ]),
                        SizedBox(height: 70),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Local Address:',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: localAddressController,
                            onChanged: (value) {
                              setState(() {
                                if (value.trim().isNotEmpty) {
                                  addressError = null;
                                } else {
                                  addressError = 'Address cannot be empty';
                                }
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.location_city,
                              ),
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorText: addressError,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: addressError == null
                                      ? Colors.blue
                                      : Colors.red,
                                  width: 3.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: addressError == null
                                      ? Colors.grey
                                      : Colors.red,
                                  width: 3.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Select your City:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          items: cities
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLocalCity = newValue;
                              if (newValue != null && newValue.isNotEmpty) {
                                cityError = null;
                              } else {
                                cityError = 'Please select a city';
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: cityError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Select your State:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          items: states
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLocalState = newValue;
                              if (newValue != null && newValue.isNotEmpty) {
                                stateError = null;
                              } else {
                                stateError = 'Please select a state';
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: stateError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: stateError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: stateError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'PinCode:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: localPinCodeController,
                          maxLength: 6,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              if (value.trim().isNotEmpty) {
                                pinCodeError = null;
                              } else {
                                pinCodeError = 'Pin code cannot be empty';
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: pinCodeError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: pinCodeError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: pinCodeError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Switch(
                        value: copyToLocal,
                        onChanged: (bool value) {
                          setState(() {
                            copyToLocal = value;
                            if (copyToLocal) {
                              copyLocalToPermanent();
                            }
                          });
                        },
                        activeColor: Colors.cyan,
                      ),
                      const Text(
                        'Is Local Address same as Permanent?',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Permanent Address',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Address
                        const Text(
                          'Permanent Address:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: permanentAddressController,
                          onChanged: (value) {
                            setState(() {
                              if (value.trim().isNotEmpty) {
                                addressError = null;
                              } else {
                                addressError = 'Address cannot be empty';
                              }
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.location_city,
                            ),
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorText: addressError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: addressError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: addressError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //City
                        const Text(
                          'City:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: cityError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                          controller: copyToLocal
                              ? localCityController
                              : copiedPermanentCityController,
                          onChanged: (value) {
                            setState(() {
                              if (value.trim().isNotEmpty) {
                                cityError = null;
                              } else {
                                cityError = 'Please select a city';
                              }
                            });
                            if (copyToLocal) {
                              copiedPermanentCityController.text = value;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // State
                        const Text(
                          'State:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: cityError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: cityError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                          controller: copyToLocal
                              ? localStateController
                              : copiedPermanentStateController,
                          onChanged: (value) {
                            setState(() {
                              if (value.trim().isNotEmpty) {
                                cityError = null;
                              } else {
                                cityError = 'Please select a city';
                              }
                            });
                            if (copyToLocal) {
                              copiedPermanentStateController.text = value;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //Pin Code
                        const Text(
                          'Pin Code:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          controller: permanentPinCodeController,
                          maxLength: 6,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              if (value.trim().isNotEmpty) {
                                pinCodeError = null;
                              } else {
                                pinCodeError = 'Pin code cannot be empty';
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: pinCodeError,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: pinCodeError == null
                                    ? Colors.blue
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: pinCodeError == null
                                    ? Colors.grey
                                    : Colors.red,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
