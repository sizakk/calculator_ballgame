// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/constant/color.dart';

class RateCard extends StatelessWidget {
  final String teamName;
  final int wins;
  final int runs;
  final int earendRuns;
  final int games;
  final int winNums;

  const RateCard({
    super.key,
    required this.teamName,
    required this.games,
    required this.wins,
    required this.runs,
    required this.earendRuns,
    required this.winNums,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _Scores(
        winNums: winNums,
        teamName: teamName,
        games: games,
        runs: runs,
        earendRuns: earendRuns,
      ),
    ]);
  }
}

class _Scores extends StatelessWidget {
  final int winNums;
  final String teamName;
  final int games;
  final int runs;
  final int earendRuns;

  const _Scores({
    Key? key,
    required this.winNums,
    required this.teamName,
    required this.games,
    required this.runs,
    required this.earendRuns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int allGamesKBO = 144;

    double expP = expPythagorean(
      runs: runs,
      earedRuns: earendRuns,
    );

    int trials = allGamesKBO - games;

    return Expanded(
      child: Column(
        children: [
          _RateResult(
            winNums: winNums,
            teamName: teamName,
            games: games,
            trials: trials,
            expP: expP,
          ),
          _WinHuddle(
            winNums: winNums,
          )
        ],
      ),
    );
  }
}

class _RateResult extends StatelessWidget {
  final int winNums;
  final String teamName;
  final int games;
  final int trials;
  final double expP;

  const _RateResult({
    required this.winNums,
    required this.teamName,
    required this.games,
    required this.trials,
    required this.expP,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: TEXT_COLOR,
      fontSize: 14,
    );
    return Column(
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
    );
  }
}

class _WinHuddle extends StatelessWidget {
  final int winNums;

  const _WinHuddle({
    required this.winNums,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: RED_COLOR,
        shape: BoxShape.rectangle,
      ),
      width: 34,
      height: 16,
      child: Text(
        '$winNums',
        textAlign: TextAlign.center,
      ),
    );
  }
}
