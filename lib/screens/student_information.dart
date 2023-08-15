// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentInformation {
  String? Name;
  String? Course;
  String? Grade;
  String? Day;
  String? Money;

  StudentInformation(
      {this.Name, this.Course, this.Grade, this.Day, this.Money});

  Map<String, dynamic> toJson() => {
        'Name': Name,
        'Day': Day,
        'Course': Course,
        'Grade': Grade,
        'Fees': Money,
      };
  factory StudentInformation.fromMap(map) {
    return StudentInformation(
      Name: map['Name'],
      Grade: map['Grade'],
      Money: map['Fees'],
      Day: map['Day'],
      Course: map['Course'],
    );
  }
}
