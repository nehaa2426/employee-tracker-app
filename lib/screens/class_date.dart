// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/roster.dart';
import 'student_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewStudentClassDate extends StatelessWidget {
  final database = FirebaseFirestore.instance;
  final StudentInformation StudentInfo;
  NewStudentClassDate({Key, key, required this.StudentInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Student",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 150),
              Text("Confirm Student",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              SizedBox(height: 20),
              Text("Name: ${StudentInfo.Name}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              SizedBox(height: 8),
              Text("Day: ${StudentInfo.Day}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              SizedBox(height: 8),
              Text("Course: ${StudentInfo.Course}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              SizedBox(height: 8),
              Text("Grade: ${StudentInfo.Grade}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              SizedBox(height: 8),
              Text("Fees: ${StudentInfo.Money}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Continue"),
                onPressed: () async {
                  await database
                      .collection('students')
                      .doc(StudentInfo.Name)
                      .set(StudentInfo.toJson());
                  updateTempList();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Nav()));
                },
              )
            ],
          ),
        ));
  }
}
