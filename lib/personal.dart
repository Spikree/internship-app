import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Personal(),
    ));

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  void clear() {
    setState(() {
      _nameError = null;
      _employeeCodeError = null;
      _mobileNumberError = null;
      _orgError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController employeeCodeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _employeeCodeError;
  String? _mobileNumberError;
  String? _orgError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool _obscurePassword = true;
  String? selectedValue;
  String? selectedBloodGroup;
  String? selectedGender;
  DateTime? _selectedDate;
  DateTime? _joiningDate;
  int? _selectedIndex = 0;
  List<String> bloodGropus = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  List<String> genders = [
    'Male',
    'Female',
    'Others',
  ];
  List<String> listItems = [
    "VIT, Pune",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5"
  ];
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
          child: Form(
            key: _formKey,
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
                        'Sign-Up',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black87,
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _nameError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _nameError = 'Enter a valid email';
                              });
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black87,
                            ),
                            hintText: "Full Name",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _nameError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _nameError = 'Enter your full name';
                              });
                              return 'Enter your full name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField<String>(
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: listItems.map((option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.corporate_fare,
                              color: Colors.black87,
                            ),
                            hintText: "Select orginization",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _orgError,
                          ),
                          validator: (value) {
                            if (value == null) {
                              setState(() {
                                _orgError = "Please select an organization";
                              });
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: employeeCodeController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.badge,
                              color: Colors.black87,
                            ),
                            hintText: "Employee Code",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _employeeCodeError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _employeeCodeError = 'Enter your employee code';
                              });
                              return 'Enter your employee code';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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

                            if (pickedDate != null &&
                                pickedDate != _joiningDate) {
                              setState(() {
                                _joiningDate = pickedDate;
                                mobileNumberController.text =
                                    _joiningDate.toString();
                              });
                            }
                          },
                          child: IgnorePointer(
                            child: TextFormField(
                              controller: mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black87,
                                ),
                                hintText: "Joining date @ VI Group",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                                errorText: _mobileNumberError,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length > 10 ||
                                    value.length < 10) {
                                  setState(() {
                                    _mobileNumberError = 'please select a date';
                                  });
                                  return 'Please select a date';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: mobileNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.golf_course_sharp,
                              color: Colors.black87,
                            ),
                            hintText: "Current Designation",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _mobileNumberError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length > 10 ||
                                value.length < 10) {
                              setState(() {
                                _mobileNumberError =
                                    'Please enter your current designation';
                              });
                              return 'Please enter your current designation';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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

                            if (pickedDate != null &&
                                pickedDate != _selectedDate) {
                              setState(() {
                                _selectedDate = pickedDate;
                                mobileNumberController.text =
                                    _selectedDate.toString();
                              });
                            }
                          },
                          child: IgnorePointer(
                            child: TextFormField(
                              controller: mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black87,
                                ),
                                hintText: "Date of birth",
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                                errorText: _mobileNumberError,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value.length > 10 ||
                                    value.length < 10) {
                                  setState(() {
                                    _mobileNumberError =
                                        'Please select your date of birth';
                                  });
                                  return 'Please select your date of birth';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                          },
                          items: genders.map((option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.male,
                              color: Colors.black87,
                            ),
                            hintText: "Gender",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _orgError,
                          ),
                          validator: (value) {
                            if (value == null) {
                              setState(() {
                                _orgError = "Please select your gender";
                              });
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButtonFormField<String>(
                          value: selectedBloodGroup,
                          onChanged: (newValue) {
                            setState(() {
                              selectedBloodGroup = newValue!;
                            });
                          },
                          items: bloodGropus.map((option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.bloodtype,
                              color: Colors.black87,
                            ),
                            hintText: "Blood Group",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _orgError,
                          ),
                          validator: (value) {
                            if (value == null) {
                              setState(() {
                                _orgError = "Please select your blood group";
                              });
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.black87,
                            ),
                            hintText: "Phone number",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _nameError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _nameError = 'Enter your phone number';
                              });
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone_android,
                              color: Colors.black87,
                            ),
                            hintText: "alternate Phone number",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _nameError,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _nameError =
                                    'Enter your alternate phone number';
                              });
                              return 'Enter your alternate phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  clear();
                                  print(nameController.text);
                                  print(employeeCodeController.text);
                                  print(mobileNumberController.text);
                                  print(passwordController.text);
                                  print(confirmPasswordController.text);
                                  print(passwordController.text);
                                  print('info saved');
                                }
                              },
                              // ignore: sort_child_properties_last
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                    height: 3,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
}
