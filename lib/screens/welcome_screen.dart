// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/login_screen.dart';
import 'package:ib_cs_hl_ia3/screens/registration_screen.dart';

import 'encpsuate.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  Encapsulate question = Encapsulate();

  String main(){
    question.setRiddle = "Ready for some serious problem solving?";
    return question.getRiddle;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: 200,
                              child: Image.asset(
                                "assets/logo.jpg",
                                fit: BoxFit.contain,
                              )),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              // SizedBox(width: 40),
                              SizedBox(
                                height:50, //height of button
                                width:150,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurple[800],
                                      elevation: 3,
                                      shape: RoundedRectangleBorder( //to set border radius to button
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => RegistrationScreen()));
                                    },
                                    child: Text("Register", style: TextStyle(
                                      fontSize: 25,
                                    ))
                                ),
                              ),
                              SizedBox(width: 30),
                              SizedBox(
                                height:50, //height of button
                                width:140,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurple[800],
                                      elevation: 3,
                                      shape: RoundedRectangleBorder( //to set border radius to button
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                    },
                                    child: Text("Login", style: TextStyle(
                                      fontSize: 25,
                                    ))
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 20),
                          Text(main(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,),
                            textAlign: TextAlign.center,
                          )
                        ])
                )
            )
        )
    );
  }
}

