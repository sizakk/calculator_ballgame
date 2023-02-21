// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/screen/exp_result.dart';
import 'package:flutter/material.dart';

import 'package:ballgame/component/back_button.dart';
import 'package:ballgame/component/custom_text_field.dart';
import 'package:ballgame/constant/color.dart';

class ExpRateInput extends StatefulWidget {
  const ExpRateInput({super.key});

  @override
  State<ExpRateInput> createState() => _ExpRateInputState();
}

class _ExpRateInputState extends State<ExpRateInput> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? runScores_1;
  int? eRunScores_1;

  int? runScores_2;
  int? eRunScores_2;

  int? runScores_3;
  int? eRunScores_3;

  int? runScores_4;
  int? eRunScores_4;

  int? runScores_5;
  int? eRunScores_5;

  int? runScores_6;
  int? eRunScores_6;

  int? runScores_7;
  int? eRunScores_7;

  int? runScores_8;
  int? eRunScores_8;

  int? runScores_9;
  int? eRunScores_9;

  int? runScores_10;
  int? eRunScores_10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: BACK_COLOR,
          body: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 80,
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        children: [
                          _Teams10(
                            runs_1: (String? val) {
                              runScores_1 = int.parse(val!);
                            },
                            eRuns_1: (String? val) {
                              eRunScores_1 = int.parse(val!);
                            },
                            runs_2: (String? val) {
                              runScores_2 = int.parse(val!);
                            },
                            eRuns_2: (String? val) {
                              eRunScores_2 = int.parse(val!);
                            },
                            runs_3: (String? val) {
                              runScores_3 = int.parse(val!);
                            },
                            eRuns_3: (String? val) {
                              eRunScores_3 = int.parse(val!);
                            },
                            runs_4: (String? val) {
                              runScores_4 = int.parse(val!);
                            },
                            eRuns_4: (String? val) {
                              eRunScores_4 = int.parse(val!);
                            },
                            runs_5: (String? val) {
                              runScores_5 = int.parse(val!);
                            },
                            eRuns_5: (String? val) {
                              eRunScores_5 = int.parse(val!);
                            },
                            runs_6: (String? val) {
                              runScores_6 = int.parse(val!);
                            },
                            eRuns_6: (String? val) {
                              eRunScores_6 = int.parse(val!);
                            },
                            runs_7: (String? val) {
                              runScores_7 = int.parse(val!);
                            },
                            eRuns_7: (String? val) {
                              eRunScores_7 = int.parse(val!);
                            },
                            runs_8: (String? val) {
                              runScores_8 = int.parse(val!);
                            },
                            eRuns_8: (String? val) {
                              eRunScores_8 = int.parse(val!);
                            },
                            runs_9: (String? val) {
                              runScores_9 = int.parse(val!);
                            },
                            eRuns_9: (String? val) {
                              eRunScores_9 = int.parse(val!);
                            },
                            runs_10: (String? val) {
                              runScores_10 = int.parse(val!);
                            },
                            eRuns_10: (String? val) {
                              eRunScores_10 = int.parse(val!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SaveButton(
                        onPressed: onSavePressed,
                      ),
                      renderBackButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    // formKey 생성은 했는데 Form 위젯과 결합하지 않음
    if (formKey.currentState == null) {
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExpResult(
            runScores_1: int.parse(runScores_1.toString()),
            eRunScores_1: int.parse(eRunScores_1.toString()),
            runScores_2: int.parse(runScores_1.toString()),
            eRunScores_2: int.parse(eRunScores_1.toString()),
            runScores_3: int.parse(runScores_1.toString()),
            eRunScores_3: int.parse(eRunScores_1.toString()),
            runScores_4: int.parse(runScores_1.toString()),
            eRunScores_4: int.parse(eRunScores_1.toString()),
            runScores_5: int.parse(runScores_1.toString()),
            eRunScores_5: int.parse(eRunScores_1.toString()),
            runScores_6: int.parse(runScores_1.toString()),
            eRunScores_6: int.parse(eRunScores_1.toString()),
            runScores_7: int.parse(runScores_1.toString()),
            eRunScores_7: int.parse(eRunScores_1.toString()),
            runScores_8: int.parse(runScores_1.toString()),
            eRunScores_8: int.parse(eRunScores_1.toString()),
            runScores_9: int.parse(runScores_1.toString()),
            eRunScores_9: int.parse(eRunScores_1.toString()),
            runScores_10: int.parse(runScores_1.toString()),
            eRunScores_10: int.parse(eRunScores_1.toString()),
          ),
        ),
      );
    } else {}
  }
}

class _Teams10 extends StatelessWidget {
  final FormFieldSetter<String> runs_1;
  final FormFieldSetter<String> eRuns_1;

  final FormFieldSetter<String> runs_2;
  final FormFieldSetter<String> eRuns_2;

  final FormFieldSetter<String> runs_3;
  final FormFieldSetter<String> eRuns_3;

  final FormFieldSetter<String> runs_4;
  final FormFieldSetter<String> eRuns_4;

  final FormFieldSetter<String> runs_5;
  final FormFieldSetter<String> eRuns_5;

  final FormFieldSetter<String> runs_6;
  final FormFieldSetter<String> eRuns_6;

  final FormFieldSetter<String> runs_7;
  final FormFieldSetter<String> eRuns_7;

  final FormFieldSetter<String> runs_8;
  final FormFieldSetter<String> eRuns_8;

  final FormFieldSetter<String> runs_9;
  final FormFieldSetter<String> eRuns_9;

  final FormFieldSetter<String> runs_10;
  final FormFieldSetter<String> eRuns_10;

  const _Teams10({
    Key? key,
    required this.runs_1,
    required this.eRuns_1,
    required this.runs_2,
    required this.eRuns_2,
    required this.runs_3,
    required this.eRuns_3,
    required this.runs_4,
    required this.eRuns_4,
    required this.runs_5,
    required this.eRuns_5,
    required this.runs_6,
    required this.eRuns_6,
    required this.runs_7,
    required this.eRuns_7,
    required this.runs_8,
    required this.eRuns_8,
    required this.runs_9,
    required this.eRuns_9,
    required this.runs_10,
    required this.eRuns_10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '1위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '2위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_2,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '3위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_3,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_3,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '4위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_4,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_4,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '5위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_5,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_5,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '6위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_6,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_6,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '7위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_7,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_7,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '8위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_8,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_8,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '9위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_9,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_9,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 90,
              child: Text(
                '10위 득점/실점',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: runs_10,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CustomTextFieldRate(
                isNums: true,
                isGames: false,
                onSaved: eRuns_10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: TEXT_COLOR,
            ),
            onPressed: onPressed,
            child: const Text(
              '기대승률 계산',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
