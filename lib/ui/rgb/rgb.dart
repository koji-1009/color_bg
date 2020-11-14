import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/color_value.dart';
import '../../util/ext/color_value_ext.dart';
import 'rgb_view_model.dart';

class RgbPage extends StatelessWidget {
  final _colorSize = const Size(120, 120);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline6;

    return HookBuilder(
      builder: (context) {
        final homeViewModel = context.read(homeViewModelNotifierProvider);
        final question = useProvider(
          homeViewModelNotifierProvider.select((value) => value.question),
        );
        final answer = useProvider(
          homeViewModelNotifierProvider.select((value) => value.answer),
        );

        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: homeViewModel.changeColor,
                  ),
                ],
              ),
            ),
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
                      height: _colorSize.height,
                      width: _colorSize.width,
                      color: question.color,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          'R',
                          style: textStyle,
                        ),
                        Expanded(
                          child: Slider(
                            value: answer.r.toDouble(),
                            min: 0,
                            max: 255,
                            label: answer.r.toString(),
                            divisions: 256,
                            onChanged: (value) {
                              homeViewModel.update(r: value.round());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            answer.r.toString(),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'G',
                          style: textStyle,
                        ),
                        Expanded(
                          child: Slider(
                            value: answer.g.toDouble(),
                            min: 0,
                            max: 255,
                            label: answer.g.toString(),
                            divisions: 256,
                            onChanged: (value) {
                              homeViewModel.update(g: value.round());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            answer.g.toString(),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'B',
                          style: textStyle,
                        ),
                        Expanded(
                          child: Slider(
                            value: answer.b.toDouble(),
                            min: 0,
                            max: 255,
                            label: answer.b.toString(),
                            divisions: 256,
                            onChanged: (value) {
                              homeViewModel.update(b: value.round());
                            },
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Text(
                            answer.b.toString(),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                    RaisedButton(
                      child: const Text('Check answer'),
                      onPressed: () {
                        _showResultSheet(
                          context: context,
                          question: question,
                          answer: answer,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showResultSheet({
    @required BuildContext context,
    @required ColorValue question,
    @required ColorValue answer,
  }) {
    final textStyle = Theme.of(context).textTheme.subtitle1;

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
                      height: _colorSize.height,
                      width: _colorSize.width,
                      color: question.color,
                    ),
                    Container(
                      height: _colorSize.height,
                      width: _colorSize.width,
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
}
