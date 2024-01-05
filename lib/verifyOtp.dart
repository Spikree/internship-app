import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyOtp(),
    ));

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String? otpError;
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  void clear() {
    setState(() {
      otpError = null;
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
                        'Verify OTP',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Center(
                        child: Text(
                          'otp has been sent to your email',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(244, 243, 243, 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black87,
                              ),
                              hintText: "enter your otp",
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              errorText: otpError,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length != 6) {
                                setState(() {
                                  otpError = 'Please enter a valid otp';
                                });
                                return 'please enter a valid otp';
                              }
                            }),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  clear();
                                  print(otpController.text);
                                  print('Otp proceed');
                                  Navigator.pushNamed(context, 'enterDetails');
                                }
                              },
                              // ignore: sort_child_properties_last
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 1),
                                child: Text(
                                  'Verify otp',
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
                          const SizedBox(
                            height: 200,
                          )
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
