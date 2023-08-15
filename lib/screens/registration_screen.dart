// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';

import '../models/user_model.dart';
import '../navigation_bar.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  // our form key
  final _formKey = GlobalKey<FormState>();
  //editing controller
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return("First Name Required");
          }
          if(!regex.hasMatch(value)){
            return("Enter Valid Name(Min. 3 Characters)");
          }
          return null;
        },
        onSaved: (value){
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "First Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));
    //lastName
    final lastNameField = TextFormField(
        autofocus: false,
        controller: lastNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if(value!.isEmpty){
            return("Last Name Required");
          }
          return null;
        },
        onSaved: (value){
          lastNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Last Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));
    //email
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
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
        onSaved: (value){
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));
    //password
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
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
        onSaved: (value){
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));
    //confirmpassword
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value){
          if(confirmPasswordEditingController.text != passwordEditingController.text){
            return "Password Does Not Match";
          }
          return null;
        },
        onSaved: (value){
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Confirm Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            )
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black54,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context). size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
      ),
    );


    //Screen UI
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                //passing this to out root
                Navigator.of(context).pop();
              },
            )
        ),
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
                              height: 120,
                              child: Image.asset(
                                "assets/logo.jpg",
                                fit: BoxFit.contain,
                              )),
                          SizedBox(height: 15),
                          firstNameField,
                          SizedBox(height: 20),
                          lastNameField,
                          SizedBox(height: 20),
                          emailField,
                          SizedBox(height: 20),
                          passwordField,
                          SizedBox(height: 20),
                          confirmPasswordField,
                          SizedBox(height: 25),
                          signUpButton,
                          SizedBox(height: 15),

                        ],
                      )
                  ),
                ),
              )
          ),
        )
    );
  }
  void signUp(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
          postDetailsToFirestore()})
          .catchError((e){
        Fluttertoast.showToast(msg:e!.message);
      });
    }
  }


  postDetailsToFirestore() async{
    //calling our firestore
    //calling our usr model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    
    //write all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;
    
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Nav()), (route) => false);
    
  }

}

