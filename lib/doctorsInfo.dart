import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final String doctorName;
  final String address;
  final String location;
  final String timing;
  final String contact;
  final String specialization;
  final String organization;

  DoctorInfo({
    super.key,
    required this.doctorName,
    required this.address,
    required this.location,
    required this.timing,
    required this.contact,
    required this.specialization,
    required this.organization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Doctors Name : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    doctorName,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text('Address : '),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    address,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Location : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    location,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Timing : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    timing,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Contact : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    contact,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Specialization : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    specialization,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Text("Organization : "),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    organization,
                    style: TextStyle(),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
