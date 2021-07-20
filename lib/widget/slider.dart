import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 1,
          activeTickMarkColor: Colors.red,
          activeTrackColor: Colors.red[100],
          inactiveTrackColor: Colors.red[50],
          thumbColor: Colors.red),
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        divisions: 6,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
