// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/EmployeeData.dart';
import 'package:ib_cs_hl_ia3/screens/encpsuate.dart';
import 'package:ib_cs_hl_ia3/screens/login_screen.dart';
import 'package:ib_cs_hl_ia3/screens/roster.dart';
import 'package:ib_cs_hl_ia3/screens/search_students.dart';
import 'package:ib_cs_hl_ia3/screens/welcome_screen.dart';

import '../models/user_model.dart';
import 'matrix_calculator.dart';
import 'normal_calculator.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  Encapsulate question = Encapsulate();

  String main(){
    question.setRiddle = "Why is 8 scared of 7?";
    return question.getRiddle;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Riddle: " + main(), style: TextStyle(fontSize: 17),),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/logo.jpg",
                          fit: BoxFit.contain
                      ),
                    ),
                    Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text("${loggedInUser.firstName} ${loggedInUser.lastName}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        )),
                    Text("${loggedInUser.email}",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 15),
                    ActionChip(
                      label: Text("Matrix Calculator"),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MatrixCalculator()));
                      },
                    ),
                    ActionChip(
                      label: Text("Employees"),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => employeeData()));
                      },
                    ),
                    ActionChip(
                      label: Text("Logout"),
                      onPressed: (){
                        logout(context);
                      },
                    ),
                  ]
              )
          )
      ),
    );
  }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => welcomeScreen()));
  }
}


