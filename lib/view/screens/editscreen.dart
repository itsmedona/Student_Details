// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:ociuz_task/view/screens/homescreen.dart';

class EditStudentScreen extends StatefulWidget {
  final String initialName;
  final int initialId;
  final String initialGrade;

  const EditStudentScreen({
    Key? key,
    required this.initialName,
    required this.initialId,
    required this.initialGrade,
  }) : super(key: key);

  @override
  _EditStudentScreenState createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  TextEditingController _editedNameController = TextEditingController();
  TextEditingController _editedIdController = TextEditingController();
  TextEditingController _editedGradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editedNameController.text = widget.initialName;
    _editedIdController.text = widget.initialId.toString();
    _editedGradeController.text = widget.initialGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Edit Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _editedNameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _editedIdController,
              decoration: InputDecoration(labelText: 'ID'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _editedGradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String editedName = _editedNameController.text;
                String editedId = _editedIdController.text;
                String editedGrade = _editedGradeController.text;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Details edited successfully!'),
                  ),
                );

                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
              child: Text('Save Edits'),
            ),
          ],
        ),
      ),
    );
  }
}
