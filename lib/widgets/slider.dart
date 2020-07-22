import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({@required this.value, @required this.onChanged});

  final int value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbColor: kButtonColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
        overlayColor: kButtonColor.withOpacity(0.12),
        activeTrackColor: KActiveColor,
        inactiveTrackColor: kDefaultInactiveColor,
      ),
      child: Slider(
        value: value.toDouble(),
        min: kMinHeight,
        max: kMaxHeight,
        onChanged: onChanged,
      ),
    );
  }
}
