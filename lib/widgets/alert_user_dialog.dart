import 'package:flutter/material.dart';

import '../utils/constants.dart';

void alertUser(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 25.0),
        actionsPadding: EdgeInsets.only(bottom: 10.0, right: 15.0, top: 10.0),
        title: Text(
          'You need to select a gender!',
          textAlign: TextAlign.center,
          style: kNumbersWarningStyle,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Approve',
              style: kBMIDescriptionStyle,
            ),
            color: kButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(10.0),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kActiveCardColor, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      );
    },
  );
}
