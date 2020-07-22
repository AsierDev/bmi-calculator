import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';
import '../widgets/cards.dart';
import '../widgets/card_content.dart';
import '../widgets/calculate_button.dart';
import '../widgets/slider.dart';
import '../widgets/icon_content.dart';
import '../utils/constants.dart';
import '../utils/calculate_bmi.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = kInitialHeight;
  int weight = kInitialWeight;
  int age = kInitialAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          // Gender Cards
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Cards(
                    onPress: () =>
                        setState(() => selectedGender = Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    onPress: () => setState(() => selectedGender = Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Height Card
          Expanded(
            child: Cards(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumbersTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  CustomSlider(
                    onChanged: (double newValue) =>
                        setState(() => height = newValue.toInt()),
                    value: height,
                  )
                ],
              ),
            ),
          ),
          // Weight and age Cards
          Expanded(
            child: Row(
              children: <Widget>[
                // Weight
                Expanded(
                  child: Cards(
                    color: kActiveCardColor,
                    cardChild: CardContent(
                      amount: weight,
                      text: 'Weight',
                      onAdd: () => setState(() => weight++),
                      onReduce: () => setState(() => weight--),
                    ),
                  ),
                ),
                // Age
                Expanded(
                  child: Cards(
                    color: kActiveCardColor,
                    cardChild: CardContent(
                      amount: age,
                      text: 'Age',
                      onAdd: () => setState(() => age++),
                      onReduce: () => setState(() => age--),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate Button
          CalculateButton(
            title: 'Calculate',
            onPress: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);

              selectedGender == null
                  ? alertUser(context)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                score: calc.getBMIValue(),
                                message: calc.getMessage(),
                                result: calc.getResult(),
                              )),
                    );
            },
          ),
        ],
      ),
    );
  }

  Future alertUser(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'You need to select a gender!',
            style: kBMIDescriptionStyle,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              color: kButtonColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: kActiveCardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0))),
        );
      },
    );
  }
}
