// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ballgame/component/calculates.dart';

class ExpRateCard extends StatelessWidget {
  final int runScores;
  final int eRunScores;
  final int teamRank;

  const ExpRateCard({
    Key? key,
    required this.runScores,
    required this.eRunScores,
    required this.teamRank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TeamExpRate(
          runScores: runScores,
          eRunScores: eRunScores,
        ),
        _ExpTeamRank(
          teamRank: teamRank,
        )
      ],
    );
  }
}

class _TeamExpRate extends StatelessWidget {
  final int runScores;
  final int eRunScores;

  const _TeamExpRate({
    Key? key,
    required this.runScores,
    required this.eRunScores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double teamRate = expPythagorean(
      runs: runScores,
      earedRuns: eRunScores,
    );

    return Row(
      children: [
        const Text(
          '1위팀 기대승률',
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          ((teamRate * 1000).floor() / 10).toString(),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

class _ExpTeamRank extends StatelessWidget {
  final int teamRank;

  const _ExpTeamRank({
    Key? key,
    required this.teamRank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '기대 순위',
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$teamRank위',
        ),
      ],
    );
  }
}
