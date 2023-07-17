import 'package:color_bootcamp/logic/answer_manager.dart';
import 'package:color_bootcamp/ui/widget/value_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HsvPanel extends ConsumerWidget {
  const HsvPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hsv = ref.watch(
      answerManagerProvider.select((value) => value.hsv),
    );

    return Column(
      children: [
        ValueSlider.hsv(
          selectValue: hsv.h,
          selectColor: HSVColor.fromAHSV(1, hsv.h, 1, 1),
          title: 'H',
          max: 360,
          divisions: 3600,
          decimal: 1,
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateH(value);
          },
        ),
        ValueSlider.hsv(
          selectValue: hsv.s,
          selectColor: HSVColor.fromColor(Colors.red).withSaturation(hsv.s),
          title: 'S',
          max: 1,
          divisions: 100,
          decimal: 2,
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateS(value);
          },
        ),
        ValueSlider.hsv(
          selectValue: hsv.v,
          selectColor: HSVColor.fromColor(Colors.white).withValue(hsv.v),
          title: 'V',
          max: 1,
          divisions: 100,
          decimal: 2,
          setValue: (value) {
            ref.read(answerManagerProvider.notifier).updateV(value);
          },
        ),
      ],
    );
  }
}
