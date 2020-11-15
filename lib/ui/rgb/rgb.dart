import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/ext/color_value_ext.dart';
import 'rgb_view_model.dart';

class RgbPage extends StatelessWidget {
  final _colorSize = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _createBottomAppBar(context),
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
                RaisedButton(
                  child: const Text('Check answer'),
                  onPressed: () {
                    _showResultSheet(context);
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
    final viewModel = context.read(rgbViewModelNotifierProvider);

    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: viewModel.changeColor,
              tooltip: 'refresh',
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
              value: selectValue.toDouble(),
              activeColor: selectColor,
              min: 0,
              max: 255,
              label: selectValue.toString(),
              divisions: 256,
              onChanged: setValue,
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              selectValue.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
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
      builder: (context) => SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'R: ${question.r}, G: ${question.g}, B: ${question.b}',
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
