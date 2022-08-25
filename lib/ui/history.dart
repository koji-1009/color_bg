import 'package:breakpoints_mq/breakpoints_mq.dart';
import 'package:color_bootcamp/data/provider/hive_history_box_provider.dart';
import 'package:color_bootcamp/ext/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final margin = MediaQuery.of(context).breakpointMargin;
    final locale = Localizations.localeOf(context);
    final format = DateFormat.yMd(locale.languageCode).add_Hms();

    final box = ref.watch(hiveHistoryBoxProvider);
    final list = box.values.toList(
      growable: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear all history?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await box.clear();
                        ref.refresh(hiveHistoryBoxProvider);

                        if (!mounted) {
                          return;
                        }

                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.clear_all_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        itemBuilder: (context, index) {
          final history = list[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: margin,
            ),
            leading: Container(
              width: 36,
              height: 36,
              color: history.question,
            ),
            title: Text(format.format(history.dateTime)),
            subtitle: Text(history.score),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: margin,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          format.format(history.dateTime),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(history.score),
                        Text('Check ${history.answer.checkTimes} times'),
                        const SizedBox(
                          height: 16,
                        ),
                        Table(
                          border: TableBorder.all(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          defaultColumnWidth: const IntrinsicColumnWidth(),
                          children: [
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Question'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    color: history.question,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'R: ${history.question.red}\n'
                                    'G: ${history.question.green}\n'
                                    'B: ${history.question.blue}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'H: ${history.question.hsv.hue.toStringAsFixed(1)}\n'
                                    'S: ${history.question.hsv.saturation.toStringAsFixed(2)}\n'
                                    'V: ${history.question.hsv.value.toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('RGB'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    color: history.answer.rgbColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'R: ${history.answer.rgbColor.red}\n'
                                    'G: ${history.answer.rgbColor.green}\n'
                                    'B: ${history.answer.rgbColor.blue}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'H: ${history.answer.rgbColor.hsv.hue.toStringAsFixed(1)}\n'
                                    'S: ${history.answer.rgbColor.hsv.saturation.toStringAsFixed(2)}\n'
                                    'V: ${history.answer.rgbColor.hsv.value.toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('HSV'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    color: history.answer.hsvColor.rgb,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'R: ${history.answer.hsvColor.rgb.red}\n'
                                    'G: ${history.answer.hsvColor.rgb.green}\n'
                                    'B: ${history.answer.hsvColor.rgb.blue}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'H: ${history.answer.hsvColor.hue.toStringAsFixed(1)}\n'
                                    'S: ${history.answer.hsvColor.saturation.toStringAsFixed(2)}\n'
                                    'V: ${history.answer.hsvColor.value.toStringAsFixed(2)}',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
