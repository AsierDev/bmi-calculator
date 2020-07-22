import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: kButtonIconSize,
        height: kButtonIconSize,
      ),
      shape: CircleBorder(),
      fillColor: kRoundButton,
    );
  }
}
