import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/ext/color_ext.dart';
import 'hsv_view_model.dart';

class HsvPage extends StatelessWidget {
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
                    color: useProvider(hsvViewModelNotifierProvider)
                        .question
                        .color,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(hsvViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.h,
                      selectColor:
                          HSVColor.fromAHSV(1, answer.h, 1, 1).toColor(),
                      title: 'H',
                      min: 0.0,
                      max: 360,
                      divisions: 3600,
                      decimal: 1,
                      setValue: (value) {
                        context
                            .read(hsvViewModelNotifierProvider)
                            .update(h: value);
                      },
                    );
                  },
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(hsvViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.s,
                      selectColor: HSVColor.fromColor(Colors.red)
                          .withSaturation(answer.s)
                          .toColor(),
                      title: 'S',
                      min: 0,
                      max: 1,
                      divisions: 100,
                      decimal: 2,
                      setValue: (value) {
                        context
                            .read(hsvViewModelNotifierProvider)
                            .update(s: value);
                      },
                    );
                  },
                ),
                HookBuilder(
                  builder: (context) {
                    final answer = useProvider(hsvViewModelNotifierProvider
                        .select((value) => value.answer));

                    return _createSpinner(
                      context: context,
                      selectValue: answer.v,
                      selectColor: HSVColor.fromColor(Colors.white)
                          .withValue(answer.v)
                          .toColor(),
                      title: 'V',
                      min: 0,
                      max: 1,
                      divisions: 100,
                      decimal: 2,
                      setValue: (value) {
                        context
                            .read(hsvViewModelNotifierProvider)
                            .update(v: value);
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
    @required double selectValue,
    @required Color selectColor,
    @required double min,
    @required double max,
    @required int divisions,
    @required int decimal,
    @required String title,
    @required ValueSetter<double> setValue,
  }) =>
      Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
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
            width: 60,
            child: Text(
              selectValue.toStringAsFixed(decimal),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      );

  void _showResultSheet(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final question = context.read(hsvViewModelNotifierProvider).question;
    final answer = context.read(hsvViewModelNotifierProvider).answer;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              question == answer ? 'Correct!' : 'Wrong',
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
    final question = context.read(hsvViewModelNotifierProvider).question;

    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'H: ${question.h.toStringAsFixed(1)}, '
              'S: ${question.s.toStringAsFixed(2)}, '
              'V: ${question.v.toStringAsFixed(2)}',
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
    context.read(hsvViewModelNotifierProvider).changeColor();
  }
}
