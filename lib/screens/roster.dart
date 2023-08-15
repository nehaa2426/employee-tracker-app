// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, use_key_in_widget_constructors, unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'encpsuate.dart';
import 'student_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List studentsInfo = [];

class StudentRoster extends StatefulWidget {
  const StudentRoster({Key? key}) : super(key: key);

  @override
  _StudentRosterState createState() => _StudentRosterState();
}

class _StudentRosterState extends State<StudentRoster> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: new ListView.builder(
          itemCount: studentsInfo.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lightBlue[100],
              elevation: 7,
              child: ListTile (
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentsInfo[index]['Name'],
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("Grade: " + studentsInfo[index]['Grade']),
                    SizedBox(height: 4),
                    Text("Course: " + studentsInfo[index]['Course']),
                    SizedBox(height: 4),
                    Text("Day: " + studentsInfo[index]['Day']),
                    SizedBox(height: 4),
                  ],
                ),
                trailing: Text("\$" + studentsInfo[index]['Fees'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: Icon(Icons.person_pin, color: Colors.lightBlue[900],),
                onLongPress: () async {
                  await FirebaseFirestore.instance
                      .collection('students').doc(studentsInfo[index]['Name']).delete();
                  studentsInfo.remove(studentsInfo[index]);
                  setState(() {});
                  // deletion
                }
              )
            );
          }
      )
    );
  }

  // Widget buildStudentCard(BuildContext context, int index) {
  //   final student = studentsInfo[index];
  //   return Container(
  //     child: Card(
  //         child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
  //             child: Row(
  //               children: <Widget>[
  //                 Text(student.Name, style: new TextStyle(fontSize: 30.0)),
  //                 Spacer(),
  //                 IconButton(
  //                   icon: Icon(Icons.delete_outline),
  //                   onPressed: () {},
  //                 )
  //               ],
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
  //             child: Row(
  //               children: <Widget>[
  //                 Text("Grade: " + student.Grade),
  //                 Spacer(),
  //               ],
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 4.0, bottom: 20.0),
  //             child: Row(
  //               children: <Widget>[
  //                 Text(student.Day),
  //                 Spacer(),
  //               ],
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
  //             child: Row(
  //               children: <Widget>[
  //                 Text(student.Course, style: new TextStyle(fontSize: 18.0)),
  //                 Spacer(),
  //                 Text("\$ ${student.Money}",
  //                     style: new TextStyle(fontSize: 15.0)),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     )),
  //   );
  // }
}


void updateTempList() async {
  studentsInfo = [];
  await FirebaseFirestore.instance.collection('students').get().then((
      querySnapshot) {
    for (var element in querySnapshot.docs) {
      studentsInfo.add(element);
    }
  });

}
