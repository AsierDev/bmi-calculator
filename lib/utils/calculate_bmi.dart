import 'dart:math';
import 'package:flutter/material.dart';

class CalculateBMI {
  CalculateBMI(
      {@required this.height, @required this.weight, @required this.age});

  final int height;
  final int weight;
  final int age;

  double _bmi;
  String _result;
  String _message;

  Map _overweight = {
    'result': 'overweight',
    'message': 'You have higher than normal body weight. Try to exercise more!'
  };

  Map _normal = {
    'result': 'normal',
    'message': 'You have a normal body weight. Good job!'
  };

  Map _underweight = {
    'result': 'underweight',
    'message':
        'You have a lower than normal body weight. You can eat a bit more!'
  };

  void setResults(res) {
    _result = res['result'];
    _message = res['message'];
  }

  String getBMIValue() {
    _bmi = weight / pow(height / 100, 2);
    if (19 <= age && age <= 24) {
      if (_bmi < 19) {
        setResults(_underweight);
      } else if (_bmi > 24) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    } else if (25 <= age && age <= 34) {
      if (_bmi < 20) {
        setResults(_underweight);
      } else if (_bmi > 25) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    } else if (35 <= age && age <= 44) {
      if (_bmi < 21) {
        setResults(_underweight);
      } else if (_bmi > 26) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    } else if (45 <= age && age <= 54) {
      if (_bmi < 22) {
        setResults(_underweight);
      } else if (_bmi > 27) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    } else if (55 <= age && age <= 64) {
      if (_bmi < 23) {
        setResults(_underweight);
      } else if (_bmi > 28) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    } else {
      if (_bmi < 24) {
        setResults(_underweight);
      } else if (_bmi > 29) {
        setResults(_overweight);
      } else {
        setResults(_normal);
      }
    }

    return _bmi.toStringAsFixed(1);
  }

  String getMessage() {
    return _message;
  }

  String getResult() {
    return _result;
  }
}
