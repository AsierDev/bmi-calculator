import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';
import 'round_icon_button.dart';

class CardContent extends StatelessWidget {
  CardContent({this.text, this.amount, this.onReduce, this.onAdd});

  final String text;
  final int amount;
  final Function onReduce;
  final Function onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // label
        Text(
          text.toUpperCase(),
          style: kLabelTextStyle,
        ),
        // Number
        Text(
          amount.toString(),
          style: kNumbersTextStyle,
        ),
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onReduce,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onAdd,
            ),
          ],
        ),
      ],
    );
  }
}
