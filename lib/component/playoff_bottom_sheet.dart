// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ballgame/component/custom_text_field.dart';
import 'package:ballgame/constant/color.dart';

class PlayoffBottomSheet extends StatefulWidget {
  const PlayoffBottomSheet({super.key});

  @override
  State<PlayoffBottomSheet> createState() => _PlayoffBottomSheetState();
}

class _PlayoffBottomSheetState extends State<PlayoffBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? teamName;
  int? gamesNums;
  int? winsNums;
  int? runScores;
  int? earendRunScores;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 2 + bottomInset,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomInset),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: 16,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _OnTeamName(
                        onTeam: (String? val) {
                          teamName = val;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _OnGames(
                        onGamesNums: (String? val) {
                          gamesNums = int.parse(val!);
                        },
                        onWinsNums: (String? val) {
                          winsNums = int.parse(val!);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      _OnScores(
                        runNums: (String? val) {
                          runScores = int.parse(val!);
                        },
                        earendRunsNums: (String? val) {
                          earendRunScores = int.parse(val!);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const _WinsHuddle(),
                      const SizedBox(
                        height: 8,
                      ),
                      _SaveButton(
                        onPressed: onSavePressed,
                      ),
                    ],
                  ),
                ),
              ),
            )),
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

      print('--------------');
      print('onTeam : $teamName');
      print('onGamesNums : $gamesNums');
      print('onWinsNums : $winsNums');
      print('runScores : $runScores');
      print('earendRunScores : $earendRunScores');
    } else {}
  }
}

class _OnGames extends StatelessWidget {
  final FormFieldSetter<String> onGamesNums;
  final FormFieldSetter<String> onWinsNums;

  const _OnGames({
    Key? key,
    required this.onGamesNums,
    required this.onWinsNums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '진행경기 수',
            isNums: true,
            onSaved: onGamesNums,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '현재 승 수',
            isNums: true,
            onSaved: onWinsNums,
          ),
        ),
      ],
    );
  }
}

class _OnScores extends StatelessWidget {
  final FormFieldSetter<String> runNums;
  final FormFieldSetter<String> earendRunsNums;

  const _OnScores({
    Key? key,
    required this.runNums,
    required this.earendRunsNums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '누계 득점',
            isNums: true,
            onSaved: runNums,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '누계 실점',
            isNums: true,
            onSaved: earendRunsNums,
          ),
        ),
      ],
    );
  }
}

class _OnTeamName extends StatelessWidget {
  final FormFieldSetter<String> onTeam;
  const _OnTeamName({
    Key? key,
    required this.onTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: '팀명 (미기재 시 랜덤)',
      isNums: false,
      onSaved: onTeam,
    );
  }
}

class _WinsHuddle extends StatelessWidget {
  const _WinsHuddle();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        renderNums('전년 기준'),
        renderNums('3년 평균'),
        renderNums('5년 평균'),
      ],
    );
  }

  Widget renderNums(String year) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: BACK_COLOR,
      ),
      width: 60,
      height: 24,
      child: Text(
        year,
        style: const TextStyle(
          color: TEXT_COLOR,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
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
              backgroundColor: BLUE_COLOR,
            ),
            onPressed: onPressed,
            child: const Text(
              '플레이오프 진출 확률 계산',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
