// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/search_students.dart';
import 'package:ib_cs_hl_ia3/screens/student_information.dart';

class StudentDetailsDisplayed extends StatefulWidget {
  const StudentDetailsDisplayed({Key? key}) : super(key: key);

  @override
  _StudentDetailsDisplayedState createState() => _StudentDetailsDisplayedState();
}

class _StudentDetailsDisplayedState extends State<StudentDetailsDisplayed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Nav()));
          },
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: 200),
            Text(studentToDisplay.Name!,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            SizedBox(height: 10),
            Text("Course: " + studentToDisplay.Course!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            SizedBox(height: 10),
            Text("Grade: " + studentToDisplay.Grade!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            SizedBox(height: 10),
            Text("Day: " + studentToDisplay.Day!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            SizedBox(height: 10),
            Text("Fees: " + studentToDisplay.Money!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            SizedBox(height: 10),
          ],
        )
      )
    );
  }
}
