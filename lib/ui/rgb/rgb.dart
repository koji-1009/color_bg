import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/color_rgb.dart';
import '../../util/ext/color_ext.dart';
import 'rgb_view_model.dart';

class RgbPage extends StatelessWidget {
  final _colorSize = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _createBottomAppBar(context),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text('Check answer'),
        onPressed: () {
          _showResultSheet(context);
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                HookBuilder(
                  builder: (context) => Container(
                    height: _colorSize,
                    width: _colorSize,
                    color: useProvider(rgbViewModelNotifierProvider)
                        .question
                        .color,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(rgbViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.r,
                      selectColor: Color.fromARGB(255, answer.r, 0, 0),
                      title: 'R',
                      setValue: (value) {
                        context
                            .read(rgbViewModelNotifierProvider)
                            .update(r: value.round());
                      },
                    );
                  },
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(rgbViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.g,
                      selectColor: Color.fromARGB(255, 0, answer.g, 0),
                      title: 'G',
                      setValue: (value) {
                        context
                            .read(rgbViewModelNotifierProvider)
                            .update(g: value.round());
                      },
                    );
                  },
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(rgbViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.b,
                      selectColor: Color.fromARGB(255, 0, 0, answer.b),
                      title: 'B',
                      setValue: (value) {
                        context
                            .read(rgbViewModelNotifierProvider)
                            .update(b: value.round());
                      },
                    );
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
  }) =>
      Row(
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
                builder: (context) => CupertinoPicker.builder(
                  scrollController:
                      FixedExtentScrollController(initialItem: selectValue),
                  itemExtent: 24,
                  childCount: 256,
                  itemBuilder: (context, index) => Text(index.toString()),
                  onSelectedItemChanged: setValue,
                ),
              );
            },
          ),
        ],
      );

  void _showResultSheet(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final question = context.read(rgbViewModelNotifierProvider).question;
    final answer = context.read(rgbViewModelNotifierProvider).answer;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _checkAnswer(question: question, answer: answer),
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 16,
            ),
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
            const SizedBox(
              height: 32,
            ),
            RaisedButton(
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
            const SizedBox(
              height: 32,
            ),
            RaisedButton(
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
