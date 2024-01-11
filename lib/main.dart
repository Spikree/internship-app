import 'package:details/HomePage/home_page.dart';
import 'package:details/ProfilePages/FamilyDetails.dart';
import 'package:details/ProfilePages/HealthInsurance.dart';
import 'package:details/ProfilePages/HealthPages/HealthDetails.dart';
import 'package:details/ProfilePages/HealthPages/medical_history.dart';
import 'package:details/ProfilePages/HealthPages/vaccination_records.dart';
import 'package:details/ProfilePages/address.dart';
import 'package:details/doctors.dart';
import 'package:details/emergencyDetails.dart';
import 'package:details/enterDetails.dart';
import 'package:details/health%20details/fitnessAndLifestyle.dart';
import 'package:details/health%20details/healthCareProvider.dart';
import 'package:details/health%20details/medicalExamination.dart';
import 'package:details/journey.dart';

import 'package:details/login.dart';
import 'package:details/personal.dart';
import 'package:details/photo.dart';
import 'package:details/profile.dart';
import 'package:details/reset_password.dart';
import 'package:details/verifyEmail.dart';
import 'package:details/verifyEmailForResetPassword.dart';
import 'package:details/verifyOtp.dart';
import 'package:details/verifyOtp1.dart';
import 'package:details/verifyOtpForPasswordReset.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
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
      'medicalExamination': (context) => const MedicalExamination(),
      'fitness': (context) => const FitnessAndLifestyle(),
      'health': (context) => const HealthCare(),
      'medical': (context) => const MedicalExamination(),
      'home': (context) => const HomeScreen(),
      'address': (context) => const Address(),
      'familyDetails': (context) => const FamilyDetails(),
      'medicalHistory': (context) => const MedicalHistory(),
      'healthDetails': (context) => const HealthDetails(),
      'vaccinationRecords': (context) => const VaccinationRecords(),
      'healthInsurance': (context) => const HealthInsurance(),
      'resetPassword': (context) => const ResetPasswordPage(),
      'verifyOtpForPassReset': (context) => const VerifyOtpReset(),
      'verifyEmailForPassReset': (context) => const VerifyEmailReset(),
      'doctor': (context) => const Doctors(),
    },
  ));
}
