// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ballgame/component/back_button.dart';
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
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  },
                ),
                Text(maxNumber.toInt().toString()),
                Expanded(
                  child: Column(
                    children: [
                      _Teams9(runNums: (String? val) {
                        runScores = int.parse(val!);
                      }, earendRunsNums: (String? val) {
                        runScores = int.parse(val!);
                      }),
                    ],
                  ),
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

class _Teams9 extends StatelessWidget {
  final FormFieldSetter<String> runNums;
  final FormFieldSetter<String> earendRunsNums;

  const _Teams9({
    Key? key,
    required this.runNums,
    required this.earendRunsNums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: '1위팀 누계득점',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: runNums,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextField(
                label: '1위팀 누계실점',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: earendRunsNums,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: '2위팀 누계득점',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: runNums,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextField(
                label: '2위팀 누계실점',
                isNums: true,
                isGames: false,
                isTeamName: false,
                onSaved: earendRunsNums,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
