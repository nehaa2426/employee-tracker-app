// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';

import '../navigation_bar.dart';

class employeeData extends StatefulWidget {
  const employeeData({Key? key}) : super(key: key);

  @override
  _employeeDataState createState() => _employeeDataState();
}

class _employeeDataState extends State<employeeData> {
  @override
  TextEditingController _teacherAddController = new TextEditingController();
  TextEditingController _teacherDeleteController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Nav()));
          },
        ),
        // title: Text("Employees"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Text("Employees", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey
          )),
          SizedBox(height: 50),
          Text("Tony Stark", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          // Text("Captain America", style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.bold,
          // )),
          Text("Hawkeye", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text("Ant-man", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text("Thor", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text("Loki", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text("Black Widow", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          SizedBox(height: 100),
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              SizedBox(
                height:50, //height of button
                width:150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      elevation: 3,
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () {
                      _showDialog(context);
                    },
                    child: Text("Add Teacher", style: TextStyle(
                      fontSize: 15,),
                      textAlign: TextAlign.center,
                    )
                ),
              ),
              SizedBox(width: 30),
              SizedBox(
                height:50, //height of button
                width:140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      elevation: 3,
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onPressed: () {
                      _showDialog2(context);
                    },
                    child: Text("Delete Teacher", style: TextStyle(
                      fontSize: 15,),
                      textAlign: TextAlign.center,
                    )
                ),
              ),

            ],
          ),
        ],
      )
    );
  }

  void addTeacher(String s) {
    Queue<String> teachers = new Queue<String>();

    List<String> teachers_data = ["Shim", "Parker", "McGoorty", "Wilder", "Manners"];
    teachers.addAll(teachers_data);

    teachers.add(s);
  }

  void _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Add Employee Name"),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _teacherAddController,
            autofocus: true,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
  void _showDialog2(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Which Employe would you like to Delete?"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _teacherDeleteController,
                autofocus: true,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
