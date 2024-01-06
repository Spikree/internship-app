import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterDetails(),
    ));

class EnterDetails extends StatefulWidget {
  const EnterDetails({super.key});

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
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
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          controller: mobileNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.black87,
                            ),
                            hintText: "Mobile No",
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
                                    'Enter a valid mobile number';
                              });
                              return 'Enter a valid mobile number';
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
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black87,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            hintText: "Set password",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _passwordError,
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _passwordError = 'Enter a password';
                              });
                              return 'Enter a password';
                            } else if (value.length < 8) {
                              setState(() {
                                _passwordError =
                                    'Password should be at least 8 characters long';
                              });
                              return 'passwords must contain more than 8 characters';
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
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black87,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            hintText: "Confirm password",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                            errorText: _confirmPasswordError,
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _confirmPasswordError = 'Confirm your password';
                              });
                              return 'Confirm your password';
                            } else if (value != passwordController.text) {
                              setState(() {
                                _confirmPasswordError =
                                    'Passwords do not match';
                              });
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
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
    );
  }
}
