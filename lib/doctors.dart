import 'package:details/doctorsInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Doctors(),
      ),
    );

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final _formKey = GlobalKey<FormState>();

  List<DoctorInfo> doctorsList = [];

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
                        'Doctors',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:
                          450, // Set a fixed height or adjust according to your design
                      child: ListView.builder(
                        itemCount: doctorsList.length,
                        itemBuilder: (context, index) {
                          return doctorsList[index];
                        },
                      ),
                    ),
                  ],
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
                            _showAddDoctorDialog(context);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddDoctorDialog(BuildContext context) async {
    TextEditingController doctorNameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController timingController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController specializationController = TextEditingController();
    TextEditingController organizationController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Doctor Information'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: doctorNameController,
                  decoration: InputDecoration(labelText: 'Doctor Name'),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: timingController,
                  decoration: InputDecoration(labelText: 'Timing'),
                ),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(labelText: 'Contact'),
                ),
                TextField(
                  controller: specializationController,
                  decoration: InputDecoration(labelText: 'Specialization'),
                ),
                TextField(
                  controller: organizationController,
                  decoration: InputDecoration(labelText: 'Organization'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                DoctorInfo newDoctor = DoctorInfo(
                  doctorName: doctorNameController.text,
                  address: addressController.text,
                  location: locationController.text,
                  timing: timingController.text,
                  contact: contactController.text,
                  specialization: specializationController.text,
                  organization: organizationController.text,
                );

                setState(() {
                  doctorsList.add(newDoctor);
                });

                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
