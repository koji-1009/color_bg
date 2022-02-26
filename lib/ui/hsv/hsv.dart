import 'package:color_bootcamp/data/model/color_hsv.dart';
import 'package:color_bootcamp/ui/hsv/hsv_view_model.dart';
import 'package:color_bootcamp/util/ext/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HsvPage extends HookConsumerWidget {
  const HsvPage({Key? key}) : super(key: key);

  final _colorSize = 120.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(
      hsvViewModelNotifierProvider.select<Color>(
        (value) => value.question.color,
      ),
    );
    final h = ref.watch(
      hsvViewModelNotifierProvider.select<double>((value) => value.answer.h),
    );
    final s = ref.watch(
      hsvViewModelNotifierProvider.select<double>((value) => value.answer.s),
    );
    final v = ref.watch(
      hsvViewModelNotifierProvider.select<double>((value) => value.answer.v),
    );

    return Scaffold(
      bottomNavigationBar: _createBottomAppBar(ref, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.check),
        label: const Text('Check answer'),
        onPressed: () {
          _showResultSheet(ref, context);
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
                  selectValue: h,
                  selectColor: HSVColor.fromAHSV(1, h, 1, 1).toColor(),
                  title: 'H',
                  min: 0.0,
                  max: 360,
                  divisions: 3600,
                  decimal: 1,
                  setValue: (value) {
                    ref.read(hsvViewModelNotifierProvider).update(h: value);
                  },
                ),
                _createSpinner(
                  context: context,
                  selectValue: s,
                  selectColor: HSVColor.fromColor(Colors.red)
                      .withSaturation(s)
                      .toColor(),
                  title: 'S',
                  min: 0,
                  max: 1,
                  divisions: 100,
                  decimal: 2,
                  setValue: (value) {
                    ref.read(hsvViewModelNotifierProvider).update(s: value);
                  },
                ),
                _createSpinner(
                  context: context,
                  selectValue: v,
                  selectColor:
                      HSVColor.fromColor(Colors.white).withValue(v).toColor(),
                  title: 'V',
                  min: 0,
                  max: 1,
                  divisions: 100,
                  decimal: 2,
                  setValue: (value) {
                    ref.read(hsvViewModelNotifierProvider).update(v: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createBottomAppBar(WidgetRef ref, BuildContext context) {
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
                _showGiveUpSheet(ref, context);
              },
              tooltip: 'give up',
            ),
          ],
        ),
      ),
    );
  }

  Widget _createSpinner({
    required BuildContext context,
    required double selectValue,
    required Color selectColor,
    required double min,
    required double max,
    required int divisions,
    required int decimal,
    required String title,
    required ValueSetter<double> setValue,
  }) {
    return Row(
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
  }

  void _showResultSheet(WidgetRef ref, BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;

    final viewModel = ref.read(hsvViewModelNotifierProvider);
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
                _nextColor(ref, context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showGiveUpSheet(WidgetRef ref, BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline6;
    final question = ref.read(hsvViewModelNotifierProvider).question;

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
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('next color'),
              onPressed: () {
                _nextColor(ref, context);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _nextColor(WidgetRef ref, BuildContext context) {
    ref.read(hsvViewModelNotifierProvider).changeColor();
  }

  String _checkAnswer({
    required ColorHSV question,
    required ColorHSV answer,
  }) {
    final result = (question.h - answer.h).abs() +
        (question.s * 100 - answer.s * 100).abs() +
        (question.v * 100 - answer.v * 100).abs();

    if (result <= 3) {
      return 'Perfect!!!';
    } else if (result <= 10) {
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
