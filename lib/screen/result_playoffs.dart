// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

class ResultPlayoffs extends StatelessWidget {
  final String teamName;
  final int gamesNums;
  final int winsNums;
  final int runScores;
  final int earendRunScores;

  const ResultPlayoffs({
    Key? key,
    required this.teamName,
    required this.gamesNums,
    required this.winsNums,
    required this.runScores,
    required this.earendRunScores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int allGamesKBO = 144;

    double expP = expPythagorean(
      runs: runScores,
      earedRuns: earendRunScores,
    );

    int trials = allGamesKBO - gamesNums;

    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: TEXT_COLOR,
      fontSize: 14,
    );

    return SafeArea(
      child: Scaffold(
          backgroundColor: BACK_COLOR,
          body: Column(
            children: [
              Text(
                teamName,
                style: textStyle,
              ),
              Text(
                '남은 $trials 경기 기대승률 $expP%',
                style: textStyle,
              ),
              const Text(
                '플레이오프 진출 확률',
                style: textStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '$expP%',
                style: textStyle,
              ),
            ],
          )),
    );
  }
}
