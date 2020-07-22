import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.title, this.onPress});

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: kCalculateButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}
