import 'package:details/enterDetails.dart';
import 'package:details/login.dart';
import 'package:details/verifyEmail.dart';
import 'package:details/verifyOtp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'enterDetails': (context) => const EnterDetails(),
      'verifyEmail': (context) => const VerifyEmail(),
      'verifyOtp': (context) => const VerifyOtp(),
      'login': (context) => const Login(),
    },
  ));
}
