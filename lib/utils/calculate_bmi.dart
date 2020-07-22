import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculateBMI {
  CalculateBMI({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _bmi;
  String _result;
  String _message;

  String getBMIValue() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      _result = 'overweight';
      _message =
          'You have higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      _result = 'normal';
      _message = 'You have a normal body weight. Good job!';
    } else {
      _result = 'underweight';
      _message =
          'You have a lower than normal body weight. You can eat a bit more!';
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
