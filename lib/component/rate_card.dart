import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

class RateCard extends StatelessWidget {
  final String myteam;
  final int games;
  final int wins;
  final int runs;
  final int earendRuns;
  // late double winRate;
  // final int huddleNum;
  // late int trial = 144 - games;

  const RateCard({
    super.key,
    required this.myteam,
    required this.games,
    required this.wins,
    required this.runs,
    required this.earendRuns,
    // required this.huddleNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        _Scores(
          runs: runs,
          earendRuns: earendRuns,
        ),
      ]),
    );
  }
}

class _Scores extends StatelessWidget {
  final String teamName = '해당 팀';
  final int runs;
  final int earendRuns;

  const _Scores({
    required this.runs,
    required this.earendRuns,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontFamily: 'NotoSans',
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 14,
    );

    double expP = expPythagorean(
      runs: runs,
      earedRuns: earendRuns,
    );

    return Column(
      children: [
        Text(
          teamName,
          style: textStyle,
        ),
        Text(
          '$runs 득점',
          style: textStyle,
        ),
        Text(
          '$earendRuns 실점',
          style: textStyle,
        ),
        Text(
          '승률 $expP%',
          style: textStyle,
        ),
      ],
    );
  }
}
