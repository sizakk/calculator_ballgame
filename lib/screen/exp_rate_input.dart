// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACK_COLOR,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.lightBlue,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: _Teams10(
                      runs_1: (String? val) {
                        runScores_1 = int.parse(val!);
                      },
                      eRuns_1: (String? val) {
                        eRunScores_1 = int.parse(val!);
                      },
                    ),
                  ),
                ),
                _SaveButton(
                  onPressed: onSavePressed,
                ),
                renderBackButton(context),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
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

      Navigator.of(context).pop();
    } else {}
  }
}

class _Teams10 extends StatelessWidget {
  final FormFieldSetter<String> runs_1;
  final FormFieldSetter<String> eRuns_1;

  const _Teams10({
    required this.runs_1,
    required this.eRuns_1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('1위 득점/실점'),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: CustomTextField(
            label: '',
            isNums: true,
            isGames: true,
            isTeamName: false,
            onSaved: runs_1,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '',
            isNums: true,
            isGames: true,
            isTeamName: false,
            onSaved: eRuns_1,
          ),
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
