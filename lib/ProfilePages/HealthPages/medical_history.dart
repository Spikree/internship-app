import 'package:flutter/material.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  final TextEditingController allergiesController = TextEditingController();
  final TextEditingController chronicConditionsController =
      TextEditingController();
  final TextEditingController previousSurgeriesController =
      TextEditingController();
  final TextEditingController injuriesController = TextEditingController();
  final TextEditingController currentMedicinesController =
      TextEditingController();
  final TextEditingController dosagesController = TextEditingController();

  late Map<TextEditingController, String?> errorMessages;

  @override
  void initState() {
    super.initState();
    errorMessages = {
      allergiesController: null,
      chronicConditionsController: null,
      previousSurgeriesController: null,
      injuriesController: null,
      currentMedicinesController: null,
      dosagesController: null,
    };
  }

  @override
  void dispose() {
    allergiesController.dispose();
    chronicConditionsController.dispose();
    previousSurgeriesController.dispose();
    injuriesController.dispose();
    currentMedicinesController.dispose();
    dosagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('images/back_two.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 65),
                Text(
                  'Medical History',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                Text(
                  'Enter Medical History.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 85),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildTextField('Allergies', allergiesController),
                buildTextField(
                    'Chronic Conditions', chronicConditionsController),
                buildTextField(
                    'Previous Surgeries', previousSurgeriesController),
                buildTextField('Injuries', injuriesController),
                buildTextField('Current Medicines', currentMedicinesController),
                buildTextField('Dosages', dosagesController),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (validateFields()) {
                    } else {
                      showFillAllFieldsError();
                    }
                  },
                  style: ButtonStyle(),
                  child: Container(
                    width: buttonWidth,
                    child: Center(
                      child: Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: controller,
              maxLines: null,
              decoration: InputDecoration(
                labelText: label,
                contentPadding: const EdgeInsets.all(12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorText: errorMessages[controller],
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool validateFields() {
    bool allFieldsFilled = true;

    for (var controller in errorMessages.keys) {
      if (controller.text.isEmpty) {
        setState(() {
          errorMessages[controller] = 'Please fill this field';
        });
        allFieldsFilled = false;
      } else {
        setState(() {
          errorMessages[controller] = null;
        });
      }
    }

    return allFieldsFilled;
  }

  void showFillAllFieldsError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all the fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
