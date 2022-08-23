import 'package:flutter/material.dart';

class ValueSlider extends StatelessWidget {
  const ValueSlider._({
    super.key,
    required this.selectValue,
    required this.selectColor,
    required this.min,
    required this.max,
    required this.divisions,
    required this.decimal,
    required this.title,
    required this.setValue,
  });

  factory ValueSlider.rgb({
    Key? key,
    required int selectValue,
    required Color selectColor,
    required String title,
    required ValueSetter<double> setValue,
  }) =>
      ValueSlider._(
        key: key,
        selectValue: selectValue.toDouble(),
        selectColor: selectColor,
        min: 0,
        max: 255,
        divisions: 256,
        decimal: 0,
        title: title,
        setValue: setValue,
      );

  factory ValueSlider.hsv({
    Key? key,
    required double selectValue,
    required HSVColor selectColor,
    required double max,
    required int divisions,
    required int decimal,
    required String title,
    required ValueSetter<double> setValue,
  }) =>
      ValueSlider._(
        selectValue: selectValue,
        selectColor: selectColor.toColor(),
        min: 0,
        max: max,
        divisions: divisions,
        decimal: decimal,
        title: title,
        setValue: setValue,
      );

  final double selectValue;
  final Color selectColor;
  final double min;
  final double max;
  final int divisions;
  final int decimal;
  final String title;
  final ValueSetter<double> setValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: Slider(
            value: selectValue,
            activeColor: selectColor,
            min: min,
            max: max,
            label: selectValue.toStringAsFixed(decimal),
            divisions: divisions,
            onChanged: setValue,
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            selectValue.toStringAsFixed(decimal),
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
