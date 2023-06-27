import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:color_bootcamp/data/model/answer.dart';
import 'package:color_bootcamp/data/model/play_mode.dart';
import 'package:color_bootcamp/ext/color_ext.dart';
import 'package:color_bootcamp/logic/answer_manager.dart';
import 'package:color_bootcamp/logic/app_theme_manager.dart';
import 'package:color_bootcamp/logic/question_manager.dart';
import 'package:color_bootcamp/ui/widget/hsv_panel.dart';
import 'package:color_bootcamp/ui/widget/rgb_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final margin = MediaQuery.of(context).breakpointMargin;

    final question = ref.watch(questionProvider);
    final mode = ref.watch(
      answerProvider.select((value) => value.mode),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color BootCamp'),
        actions: [
          PopupMenuButton<_OptionMenu>(
            tooltip: 'Option Menu',
            onSelected: (value) async {
              switch (value) {
                case _OptionMenu.history:
                  context.go('/history');
                  break;
                case _OptionMenu.themeMode:
                  final mode = await showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(1, 0, 0, 0),
                    items: [
                      const PopupMenuItem<ThemeMode>(
                        value: ThemeMode.light,
                        child: Text('Light theme'),
                      ),
                      const PopupMenuItem<ThemeMode>(
                        value: ThemeMode.dark,
                        child: Text('Dark theme'),
                      ),
                      const PopupMenuItem<ThemeMode>(
                        value: ThemeMode.system,
                        child: Text('System settings'),
                      ),
                    ],
                  );
                  if (mode == null) {
                    return;
                  }

                  ref.read(themeModeProvider.notifier).update(mode);
                  break;
                case _OptionMenu.license:
                  showLicensePage(
                    context: context,
                  );
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: _OptionMenu.history,
                child: Text('History'),
              ),
              PopupMenuItem(
                value: _OptionMenu.themeMode,
                child: Text('Theme Mode'),
              ),
              PopupMenuItem(
                value: _OptionMenu.license,
                child: Text('License'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: margin,
          vertical: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Spacer(),
                ToggleButtons(
                  isSelected: mode.isSelectedList,
                  onPressed: (index) {
                    ref.read(answerProvider.notifier).changePlayMode(
                          mode: PlayMode.values[index],
                        );
                  },
                  children: [
                    ...PlayMode.values.map(
                      (e) => Text(e.title),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 120,
              width: 120,
              color: question,
            ),
            const SizedBox(
              height: 16,
            ),
            mode.body,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Check',
        icon: const Icon(Icons.check),
        label: const Text('Check'),
        onPressed: () {
          final checkTimes = ref.read(answerProvider.notifier).checkTimes();
          final answer = ref.read(answerProvider.notifier).answer;

          showModalBottomSheet(
            context: context,
            builder: (context) => SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: margin,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Check $checkTimes times',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      ref.read(answerProvider.notifier).scoreText(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Table(
                      defaultColumnWidth: const FixedColumnWidth(120),
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Question',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Answer',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              color: question,
                            ),
                            Container(
                              height: 120,
                              width: 120,
                              color: answer.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OutlinedButton(
                      child: const Text('next color'),
                      onPressed: () {
                        ref.read(answerProvider.notifier).saveResult();
                        ref.invalidate(questionProvider);

                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                tooltip: 'Give up',
                icon: const Icon(Icons.flag_outlined),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: margin,
                          vertical: 16,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            mode == PlayMode.rgb
                                ? Text(
                                    'R: ${question.red}, '
                                    'G: ${question.green}, '
                                    'B: ${question.blue}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                : Text(
                                    'H: ${question.hsv.hue.toStringAsFixed(1)}, '
                                    'S: ${question.hsv.saturation.toStringAsFixed(2)}, '
                                    'V: ${question.hsv.value.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                            const SizedBox(
                              height: 32,
                            ),
                            OutlinedButton(
                              child: const Text('next color'),
                              onPressed: () {
                                ref.read(answerProvider.notifier).saveResult();
                                ref.invalidate(questionProvider);

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _OptionMenu {
  history,
  themeMode,
  license,
}

extension on PlayMode {
  String get title {
    switch (this) {
      case PlayMode.rgb:
        return 'RGB';
      case PlayMode.hsv:
        return 'HSV';
    }
  }

  List<bool> get isSelectedList {
    switch (this) {
      case PlayMode.rgb:
        return [true, false];
      case PlayMode.hsv:
        return [false, true];
    }
  }

  Widget get body {
    switch (this) {
      case PlayMode.rgb:
        return const RgbPanel();
      case PlayMode.hsv:
        return const HsvPanel();
    }
  }
}
