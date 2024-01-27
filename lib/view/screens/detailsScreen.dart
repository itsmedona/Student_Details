import 'package:flutter/material.dart';
import 'package:ociuz_task/view/screens/homescreen.dart';

class DetailsPage extends StatelessWidget {
  final Student student;

  const DetailsPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Name: ${student.name}"),
            Text("ID: ${student.id}"),
            Text("Grade: ${student.grade}"),
          ],
        ),
      ),
    );
  }
}
