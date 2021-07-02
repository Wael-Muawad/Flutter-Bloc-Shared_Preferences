import 'package:flutter/material.dart';

class Course {
  int id;
  String model;
  Color color;
  int mark;

  Course({this.id, this.model, this.color, this.mark});

  Map <String, dynamic> objectToMap() {
    return {
      'id': this.id,
      'model': this.model,
      'color': this.color,
      'mark': this.mark,
    };
  }

}