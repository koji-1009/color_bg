import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/color_rgb.dart';
import '../../util/ext/color_ext.dart';
import 'rgb_view_model.dart';

class RgbPage extends HookWidget {
  const RgbPage({Key key}) : super(key: key);

  final _colorSize = 120.0;

  @override
  Widget build(BuildContext context) {
    final color = useProvider(
        rgbViewModelNotifierProvider.select((value) => value.question.color));
    final r = useProvider(
        rgbViewModelNotifierProvider.select((value) => value.answer.r));
    final g = useProvider(
        rgbViewModelNotifierProvider.select((value) => value.answer.g));
    final b = useProvider(
        rgbViewModelNotifierProvider.select((value) => value.answer.b));

    return Scaffold(
      bottomNavigationBar: _createBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text('Check answer'),
        onPressed: () {
          _showResultSheet(context);
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Container(
                  height: _colorSize,
                  width: _colorSize,
                  color: color,
                ),
                const SizedBox(height: 24),
                _createSpinner(
                  context: context,
                  selectValue: r,
                  selectColor: Color.fromARGB(255, r, 0, 0),
                  title: 'R',
                  setValue: (value) {
                    context
                        .read(rgbViewModelNotifierProvider)
                        .update(r: value.round());
                  },
                ),
                _createSpinner(
                  context: context,
                  selectValue: g,
                  selectColor: Color.fromARGB(255, 0, g, 0),
                  title: 'G',
                  setValue: (value) {
                    context
                        .read(rgbViewModelNotifierProvider)
                        .update(g: value.round());
                  },
                ),
                _createSpinner(
                  context: context,
                  selectValue: b,
                  selectColor: Color.fromARGB(255, 0, 0, b),
                  title: 'B',
                  setValue: (value) {
                    context
                        .read(rgbViewModelNotifierProvider)
                        .update(b: value.round());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'back screen',
            ),
            IconButton(
              icon: const Icon(Icons.flag_outlined),
              onPressed: () {
                _showGiveUpSheet(context);
              },
              tooltip: 'give up',
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSpinner({
    @required BuildContext context,
    @required int selectValue,
    @required Color selectColor,
    @required String title,
    @required ValueSetter<int> setValue,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Expanded(
          child: Slider(
            value: selectValue.toDouble(),
            activeColor: selectColor,
            min: 0,
            max: 255,
            label: selectValue.toString(),
            divisions: 256,
            onChanged: (value) {
              setValue(value.toInt());
            },
          ),
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              width: 40,
              child: Text(
                selectValue.toString(),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                      height: 120,
                      child: Center(
                        child: SizedBox(
                          width: 120,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: TextEditingController(
                              text: selectValue.toString(),
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Color $title',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('^([012]?)([0-9]{0,2})'),
                              )
                            ],
                            onSubmitted: (value) {
                              final input = int.parse(value);
                              setValue(min(input, 255));

                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ));
          },
        ),
      ],
    );
  }

  void _showResultSheet(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;

    final viewModel = context.read(rgbViewModelNotifierProvider);
    final question = viewModel.question;
    final answer = viewModel.answer;

    viewModel.countUpCheckTimes();
    final checkTimes = viewModel.checkTimes;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Check $checkTimes times',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              _checkAnswer(question: question, answer: answer),
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            Table(
              children: [
                TableRow(
                  children: [
                    Text(
                      'Question',
                      style: textStyle,
                    ),
                    Text(
                      'Answer',
                      style: textStyle,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      height: _colorSize,
                      width: _colorSize,
                      color: question.color,
                    ),
                    Container(
                      height: _colorSize,
                      width: _colorSize,
                      color: answer.color,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('next color'),
              onPressed: () {
                _nextColor(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showGiveUpSheet(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline6;
    final question = context.read(rgbViewModelNotifierProvider).question;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'R: ${question.r}, G: ${question.g}, B: ${question.b}',
              style: textStyle,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('next color'),
              onPressed: () {
                _nextColor(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _nextColor(BuildContext context) {
    context.read(rgbViewModelNotifierProvider).changeColor();
  }

  String _checkAnswer({
    @required ColorRGB question,
    @required ColorRGB answer,
  }) {
    final result = (question.r - answer.r).abs() +
        (question.g - answer.g).abs() +
        (question.b - answer.b).abs();

    if (result <= 3) {
      return 'Perfect!!!';
    } else if (result <= 15) {
      return 'Excellent!';
    } else if (result <= 30) {
      return 'Good';
    } else if (result <= 60) {
      return 'Fair';
    } else if (result <= 100) {
      return 'Poor...';
    } else {
      return 'Wrong';
    }
  }
}
