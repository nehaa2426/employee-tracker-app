// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/screens/class_date.dart';
import 'package:ib_cs_hl_ia3/screens/roster.dart';
import 'student_information.dart';

class NewStudentNameField extends StatelessWidget {
  final StudentInformation StudentInfo;
  NewStudentNameField({Key, key, required this.StudentInfo}) : super(key:key);



  @override
  Widget build(BuildContext context) {

    TextEditingController _nameController = new TextEditingController();
    TextEditingController _gradeController = new TextEditingController();
    TextEditingController _courseController = new TextEditingController();
    TextEditingController _dayController = new TextEditingController();
    TextEditingController _moneyController = new TextEditingController();

    // _nameController.text = StudentInfo.Name;
    // _moneyController.text = StudentInfo.Money;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enter Student Name"),
              //Name
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
                child: TextFormField(
                  controller: _nameController,
                  autofocus: true,
                ),
              ),
              Text("Enter Grade"),
              //Grade
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _gradeController,
                  autofocus: true,
                ),
              ),
              //course
              Text("Math Level"),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
                child: TextFormField(
                  controller: _courseController,
                  autofocus: true,
                ),
              ),
              Text("Enter Day of Class"),
              //Day
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
                child: TextFormField(
                  controller: _dayController,
                  autofocus: true,
                ),
              ),
              Text("Course Fees"),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _moneyController,
                  autofocus: true,
                ),
              ),
              ElevatedButton(
                child: Text("Add Student"),
                onPressed: (){
                  StudentInfo.Name = _nameController.text;
                  StudentInfo.Day = _dayController.text;
                  StudentInfo.Grade = _gradeController.text;
                  StudentInfo.Course = _courseController.text;
                  StudentInfo.Money = _moneyController.text;
                  updateTempList();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewStudentClassDate(StudentInfo: StudentInfo)));
                },
              )
            ],
          ),
        ),
      )
    );
  }
}
