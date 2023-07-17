import 'package:color_bootcamp/logic/answer_manager.dart';
import 'package:color_bootcamp/ui/widget/value_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RgbPanel extends ConsumerWidget {
  const RgbPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rgb = ref.watch(
      answerManagerProvider.select((value) => value.rgb),
    );

    return Column(
      children: [
        ValueSlider.rgb(
          selectValue: rgb.r,
          selectColor: Color.fromARGB(255, rgb.r, 0, 0),
          title: 'R',
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateR(value.round());
          },
        ),
        ValueSlider.rgb(
          selectValue: rgb.g,
          selectColor: Color.fromARGB(255, 0, rgb.g, 0),
          title: 'G',
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateG(value.round());
          },
        ),
        ValueSlider.rgb(
          selectValue: rgb.b,
          selectColor: Color.fromARGB(255, 0, 0, rgb.b),
          title: 'B',
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateB(value.round());
          },
        ),
      ],
    );
  }
}
