// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/constant/team_names.dart';
import 'package:ballgame/screen/result_playoffs.dart';
import 'package:flutter/material.dart';
import 'package:ballgame/component/custom_text_field.dart';
import 'package:ballgame/constant/color.dart';
import 'dart:math';

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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _OnTeamName(
                          onTeam: (String? val) {
                            if (val == '') {
                              teamName = randomNames[
                                  Random().nextInt(randomNames.length)];
                            } else {
                              teamName = val;
                            }
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

      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPlayoffs(
                  teamName: teamName.toString(),
                  gamesNums: int.parse(gamesNums.toString()),
                  winsNums: int.parse(winsNums.toString()),
                  runScores: int.parse(runScores.toString()),
                  earendRunScores: int.parse(earendRunScores.toString()),
                )),
      );
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextField(
            label: '진행경기 수',
            isNums: true,
            isGames: true,
            isTeamName: false,
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
            isGames: true,
            isTeamName: false,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextField(
            label: '누계 득점',
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
            label: '누계 실점',
            isNums: true,
            isGames: false,
            isTeamName: false,
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
      isGames: false,
      isTeamName: true,
      onSaved: onTeam,
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
