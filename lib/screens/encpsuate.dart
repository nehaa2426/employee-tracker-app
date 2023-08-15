
import 'dart:core';

class Encapsulate {
  late String _riddle;

  String get getRiddle {
    return _riddle;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set setRiddle(String riddle) {
    _riddle = riddle;
  }

}