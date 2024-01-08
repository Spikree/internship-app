import 'package:details/emergencyDetails.dart';
import 'package:details/enterDetails.dart';
import 'package:details/journey.dart';

import 'package:details/login.dart';
import 'package:details/personal.dart';
import 'package:details/photo.dart';
import 'package:details/profile.dart';
import 'package:details/verifyEmail.dart';
import 'package:details/verifyOtp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'profile',
    routes: {
      'enterDetails': (context) => const EnterDetails(),
      'verifyEmail': (context) => const VerifyEmail(),
      'verifyOtp': (context) => const VerifyOtp(),
      'login': (context) => const Login(),
      'photo': (context) => const Photo(),
      'profile': (context) => ProfileSection(),
      'personal': (context) => const Personal(),
      'emergencyDetails': (context) => const EmergencyDetails(),
      'journey': (context) => const Journey(),
    },
  ));
}
