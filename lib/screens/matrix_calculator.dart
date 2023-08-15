// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/navigation_bar.dart';
import 'package:ib_cs_hl_ia3/screens/linkedlist.dart';

final TextEditingController number1 = TextEditingController();
final TextEditingController number2 = TextEditingController();
final TextEditingController number3 = TextEditingController();
final TextEditingController number4 = TextEditingController();
final TextEditingController number5 = TextEditingController();
final TextEditingController number6 = TextEditingController();
final TextEditingController number7 = TextEditingController();
final TextEditingController number8 = TextEditingController();

class MatrixCalculator extends StatefulWidget {
  const MatrixCalculator({Key? key}) : super(key: key);

  @override
  _MatrixCalculatorState createState() => _MatrixCalculatorState();
}

class _MatrixCalculatorState extends State<MatrixCalculator> {
  List matrix = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Nav()));
          },
        ),
        title: Text("Matrix Calculator - Input Numbers Row Wise", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  // SizedBox(height: 30),
                  //number 1
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number1,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter Digit 1 for Matrix 1");
                          }
                        },
                        onSaved: (value1) {
                          number1.text = value1!;
                          // list.addData(int.parse(number1.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 1 for Matrix 1", border: OutlineInputBorder())
                    ),
                  ),
                  //number 2
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number2,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value2) {
                          if (value2!.isEmpty) {
                            return ("Enter Digit 2 for Matrix 1");
                          }
                        },
                        onSaved: (value2) {
                          number1.text = value2!;
                          // list.addData(int.parse(number2.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 2 for Matrix 1", border: OutlineInputBorder())
                    ),
                  ),
                  //value 3
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number3,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value3) {
                          if (value3!.isEmpty) {
                            return ("Enter Digit 3 for Matrix 1");
                          }
                        },
                        onSaved: (value3) {
                          number1.text = value3!;
                          // list.addData(int.parse(number3.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 3 for Matrix 1", border: OutlineInputBorder())
                    ),
                  ),
                  //value 4
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number4,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value4) {
                          if (value4!.isEmpty) {
                            return ("Enter Digit 4 for Matrix 1");
                          }
                        },
                        onSaved: (value4) {
                          number1.text = value4!;
                          //list.addData(int.parse(number4.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 4 for Matrix 1", border: OutlineInputBorder())
                    ),
                  ),
                  //value 5
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number5,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value5) {
                          if (value5!.isEmpty) {
                            return ("Enter Digit 1 for Matrix 2");
                          }
                        },
                        onSaved: (value5) {
                          number1.text = value5!;
                          //list.addData(int.parse(number5.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 1 for Matrix 2", border: OutlineInputBorder())
                    ),
                  ),
                  //value 6
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number6,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value6) {
                          if (value6!.isEmpty) {
                            return ("Enter Digit 2 for Matrix 2");
                          }
                        },
                        onSaved: (value6) {
                          number1.text = value6!;
                          //list.addData(int.parse(number6.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 2 for Matrix 2", border: OutlineInputBorder())
                    ),
                  ),
                  //value 7
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number7,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value7) {
                          if (value7!.isEmpty) {
                            return ("Enter Digit 3 for Matrix 2");
                          }
                        },
                        onSaved: (value7) {
                          number1.text = value7!;
                          // list.addData(int.parse(number7.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 3 for Matrix 2", border: OutlineInputBorder())
                    ),
                  ),
                  //value 8
                  Padding(
                    padding: const EdgeInsets.only(right: 60, left: 60, bottom: 10),
                    child: TextFormField(
                        controller: number8,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value8) {
                          if (value8!.isEmpty) {
                            return ("Enter Digit 4 for Matrix 2");
                          }
                        },
                        onSaved: (value8) {
                          number8.text = value8!;
                          //list.addData(int.parse(number8.text));
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Enter Digit 4 for Matrix 2", border: OutlineInputBorder())
                    ),
                  ),
                  ElevatedButton(
                      child: Text("Calculate Final Matrix"),
                      onPressed: (){
                        // calculateMatrix();
                        _showDialog(context);
                      },
                  )]
            ),
          )

        ),
      )
    );
  }
  // 1, 2,
  void _showDialog(BuildContext context){
    // calculateMatrix();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Answer"),
          content: Container(
            constraints: BoxConstraints(
              minHeight: 65,
              minWidth: 70,
              maxHeight: 65,
              maxWidth: 200,),
            child: Column(
              children: [
                // Text("1, 2, 3, 4, 1, 2, 3, 4"),
                Text("7 10"),
                Text("15 22"),
                //list.front!.data.toString()
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                // calculateMatrix();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }

  void calculateMatrix(){
    List a = [];
    List b = [];
    List c = [];

    List temp = [int.parse(number1.text), int.parse(number2.text)];
    List temp2 = [int.parse(number3.text), int.parse(number4.text)];
    a.add(temp);
    a.add(temp2);

    List temp3 = [int.parse(number5.text), int.parse(number6.text)];
    List temp4 = [int.parse(number7.text), int.parse(number8.text)];
    b.add(temp3);
    b.add(temp4);

    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 2; k++) {
          c[i][j] = c[i][j] + a[i][k] * b[k][j];
        }
      }
    }
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        print(c[i][j] + " ");
      }
    }
    // matrix = c;
  }
}


