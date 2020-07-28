import 'package:bmi_calculator/widgets/alert_user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';
import '../utils/constants.dart';
import '../utils/calculate_bmi.dart';
import '../widgets/cards.dart';
import '../widgets/card_content.dart';
import '../widgets/calculate_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/slider.dart';

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
                      color: selectedGender == Gender.female
                          ? KActiveColor
                          : kDefaultInactiveColor,
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
                      color: selectedGender == Gender.male
                          ? KActiveColor
                          : kDefaultInactiveColor,
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
                      onAdd:
                          weight < 200 ? () => setState(() => weight++) : null,
                      onReduce:
                          weight > 40 ? () => setState(() => weight--) : null,
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
                      onAdd: age < 120 ? () => setState(() => age++) : null,
                      onReduce: age > 18 ? () => setState(() => age--) : null,
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
              handlePress(context);
            },
          ),
        ],
      ),
    );
  }

  defaultValues() {
    setState(() {
      selectedGender = null;
      height = kInitialHeight;
      weight = kInitialWeight;
      age = kInitialAge;
    });
  }

  void handlePress(BuildContext context) {
    CalculateBMI calc = CalculateBMI(height: height, weight: weight, age: age);
    selectedGender == null
        ? alertUser(context)
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                score: calc.getBMIValue(),
                message: calc.getMessage(),
                result: calc.getResult(),
                resetValues: defaultValues,
              ),
            ),
          );
  }
}
