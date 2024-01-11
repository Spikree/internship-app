import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DoctorInfo> doctorsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          return doctorsList[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDoctorDialog(context),
        child: Icon(Icons.add),
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

class DoctorInfo extends StatelessWidget {
  // ... (unchanged)

  @override
  Widget build(BuildContext context) {
    // ... (unchanged)
  }
}
