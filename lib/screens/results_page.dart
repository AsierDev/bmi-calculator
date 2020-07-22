import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/cards.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.score, @required this.result, @required this.message});

  final String score;
  final String result;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kNumbersTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Cards(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: kResultsTextStyle,
                  ),
                  Text(
                    score,
                    style: kResultsScoreStyle,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: kBMIDescriptionStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CalculateButton(
              title: 'Re-Calculate',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
