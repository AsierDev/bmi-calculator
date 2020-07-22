import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
