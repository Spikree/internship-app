import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class HealthCheckUp extends StatefulWidget {
  const HealthCheckUp({Key? key}) : super(key: key);

  @override
  State<HealthCheckUp> createState() => _HealthCheckUp();
}

class _HealthCheckUp extends State<HealthCheckUp> {
  late  TextEditingController _dataEntryController = TextEditingController();
  late  TextEditingController _dateDialogController = TextEditingController();
  final TextEditingController _pdfEntryController = TextEditingController();
  final List<Map<String, String>> _dataEntries = [];
  DateTime selectedDate = DateTime.now();

  String _getFileName(String path) {
    List<String> parts = path.split('/');
    return parts.last;
  }
  @override
  void initState() {
    super.initState();
    _dataEntryController = TextEditingController();
    _dateDialogController = TextEditingController();
  }

  void _editEntry(int index) {
    setState(() {
      _dataEntryController.text = _dataEntries[index]['data'] ?? '';
      _dateDialogController.text = _dataEntries[index]['date'] ?? '';
      _pdfEntryController.text = _dataEntries[index]['pdf'] ?? '';
      _dataEntries.removeAt(index);
    });

    _showPopup();
  }

  void _deleteEntry(int index) {
    setState(() {
      _dataEntries.removeAt(index);
    });
  }

  void _showPopup() {
    DateTime selectedDateTemp = selectedDate;
    _dateDialogController.text = DateFormat('dd-MM-yyyy').format(selectedDateTemp);

    String? pdfFilePath;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Check-Up Details'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _dataEntryController,
                  decoration: InputDecoration(
                    labelText: 'Enter CheckUp Details',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _dataEntryController.text.isEmpty ? Colors.red : Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Select Date:'),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _dateDialogController,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDateTemp,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDateTemp = pickedDate;
                              _dateDialogController.text =
                                  DateFormat('dd-MM-yyyy').format(selectedDateTemp);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Date',
                          suffixIcon: const Icon(Icons.calendar_today),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _dateDialogController.text.isEmpty ? Colors.red : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Disease Details'),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );

                        if (result != null && result.files.isNotEmpty) {
                          pdfFilePath = result.files.single.path;
                        }
                      },
                      child: const Text('Browse'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_dataEntryController.text.isNotEmpty && _dateDialogController.text.isNotEmpty) {
                  String data = _dataEntryController.text;
                  String date = _dateDialogController.text;

                  _dataEntryController.clear();

                  setState(() {
                    String pdfFileName = pdfFilePath != null ? _getFileName(pdfFilePath!) : '';
                    _dataEntries.add({'data': data, 'date': date, 'pdf': pdfFileName});
                  });

                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all required fields')),
                  );
                }
              },
              child: const Text('Add'),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/back_two.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 65),
                  Text(
                    'Health Check-Up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Enter Check-Up History.',
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
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your Entries:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DataTable(
                      columns:  const [
                        DataColumn(label: Text('Check Up Type')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('PDF')),
                        DataColumn(label: Text('')),
                        DataColumn(label: Text(''))
                      ],
                      rows: _dataEntries
                          .asMap()
                          .entries
                          .map(
                            (entry) => DataRow(
                          cells: [
                            DataCell(Text(entry.value['data'] ?? '')),
                            DataCell(Text(entry.value['date'] ?? '')),
                            DataCell(Text(entry.value['pdf'] ?? '')),
                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _editEntry(entry.key);
                                },
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _deleteEntry(entry.key);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPopup,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  void dispose() {
    _dataEntryController.dispose();
    _pdfEntryController.dispose();
    super.dispose();
  }
}
