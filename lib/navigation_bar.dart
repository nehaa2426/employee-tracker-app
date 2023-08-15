// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/screens/nameField.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/roster.dart';
import 'package:ib_cs_hl_ia3/screens/search_students.dart';
import 'package:ib_cs_hl_ia3/screens/student_information.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _currentIndex = 0;
  List<Widget> _children = [
    HomeScreen(),
    StudentRoster(),
    SearchStudents(),
  ];
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final newStudent = new StudentInformation();
    return Scaffold(
      appBar: AppBar(
        title: Text ("Math Students Tracker", style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewStudentNameField(StudentInfo: newStudent,)));
            },
          )
        ],
      ),
      body: Center(
        child: _children.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black38,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: ("Roster"),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: ("Search"),
            ),
          ],
      ),
    );
  }

}
