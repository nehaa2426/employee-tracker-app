// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/registration_screen.dart';

import 'encpsuate.dart';
import 'roster.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  Encapsulate question = Encapsulate();

  String main(){
    question.setRiddle = "What is the smallest whole number that is "
        "equal to seven times the sum of its digits?";
    return question.getRiddle;
  }



  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        //
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty){
            return("Please Enter Your Email");
          }
          //reg expression for email validation
          if(!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return("Password is required for login");
          }
          if(!regex.hasMatch(value)){
            return("Enter Valid Password(Min. 6 Characters)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black54,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Form(
                      key: _formKey,
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
                          SizedBox(height: 25),
                          emailField,
                          SizedBox(height: 20),
                          passwordField,
                          SizedBox(height: 35),
                          loginButton,
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Dont have an aacount? "),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => RegistrationScreen()));
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15
                                      ),
                                    )
                                )
                              ]
                          ),
                          SizedBox(height: 15),
                          Text("Riddle: " + main(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),)
                        ],
                      )
                  ),
                ),
              )
          ),
        )
    );
  }
  //login function
  void signIn(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        updateTempList(),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Nav())),
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}




