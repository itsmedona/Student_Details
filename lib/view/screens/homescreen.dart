import 'package:flutter/material.dart';
import 'package:ociuz_task/view/screens/detailsscreen.dart';

class Student {
  final String name;
  final int id;
  final String grade;

  Student({required this.name, required this.id, required this.grade});
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Student> studentsList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Enter Student Details..."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Student ID'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addStudent();
              },
              child: Text('Add Student'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: studentsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(studentsList[index].name),
                    subtitle: Text(
                        "ID: ${studentsList[index].id}, Grade: ${studentsList[index].grade}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editStudent(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteStudent(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            navigateToDetailsPage(studentsList[index]);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addStudent() {
    String name = nameController.text;
    int id = int.parse(idController.text);
    String grade = gradeController.text;

    Student newStudent = Student(name: name, id: id, grade: grade);
    setState(() {
      studentsList.add(newStudent);
    });

    clearTextFields();
  }

  void editStudent(int index) {
    nameController.text = studentsList[index].name;
    idController.text = studentsList[index].id.toString();
    gradeController.text = studentsList[index].grade;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Student Details'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Student ID'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: gradeController,
                decoration: InputDecoration(labelText: 'Grade'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                clearTextFields();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                studentsList[index] = Student(
                  name: nameController.text,
                  id: int.parse(idController.text),
                  grade: gradeController.text,
                );
                Navigator.pop(context);
                clearTextFields();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void deleteStudent(int index) {
    setState(() {
      studentsList.removeAt(index);
    });
  }

  void clearTextFields() {
    nameController.clear();
    idController.clear();
    gradeController.clear();
  }

  void navigateToDetailsPage(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(student: student),
      ),
    );
  }
}
