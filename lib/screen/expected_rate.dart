// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/component/back_button.dart';
import 'package:flutter/material.dart';

import 'package:ballgame/component/custom_text_field.dart';
import 'package:ballgame/constant/color.dart';

class ExpectedRate extends StatefulWidget {
  const ExpectedRate({super.key});

  @override
  State<ExpectedRate> createState() => _ExpectedRateState();
}

class _ExpectedRateState extends State<ExpectedRate> {
  final GlobalKey<FormState> formKey = GlobalKey();

  double maxNumber = 10;
  int? runScores;
  int? earendRunScores;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: BACK_COLOR,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Slider(
                  value: maxNumber,
                  min: 4,
                  max: 10,
                  divisions: 6,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  },
                ),
                Text(maxNumber.toInt().toString()),
                Expanded(
                  child: ListView.builder(
                      itemCount: maxNumber.toInt(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${index + 1}위팀 득점/실점',
                              ),
                            ),
                            Expanded(
                              child: _TeamBoards(
                                maxNumber: maxNumber,
                                runNums: (String? val) {
                                  runScores = int.parse(val!);
                                },
                                earendRunsNums: (String? val) {
                                  runScores = int.parse(val!);
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TEXT_COLOR,
                  ),
                  onPressed: () {},
                  child: const Text(
                    '기대승률 보기',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                renderBackButton(context),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}

class _TeamBoards extends StatefulWidget {
  final FormFieldSetter<String> runNums;
  final FormFieldSetter<String> earendRunsNums;
  final double maxNumber;

  const _TeamBoards({
    Key? key,
    required this.runNums,
    required this.earendRunsNums,
    required this.maxNumber,
  }) : super(key: key);

  @override
  State<_TeamBoards> createState() => _TeamBoardsState();
}

class _TeamBoardsState extends State<_TeamBoards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: '',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: widget.runNums,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextField(
                label: '',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: widget.earendRunsNums,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
