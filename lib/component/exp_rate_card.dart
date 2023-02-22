// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ExpRateCard extends StatelessWidget {
  // final int runScores;
  // final int eRunScores;
  final int currentTeamRank;
  final double expRate;
  final int expTeamRank;

  const ExpRateCard({
    Key? key,
    required this.currentTeamRank,
    required this.expRate,
    required this.expTeamRank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TeamExpRate(
          // runScores: runScores,
          // eRunScores: eRunScores,
          expRate: expRate,
          currentTeamRank: currentTeamRank,
        ),
        _ExpTeamRank(
          teamRank: expTeamRank,
        )
      ],
    );
  }
}

class _TeamExpRate extends StatelessWidget {
  // final int runScores;
  // final int eRunScores;
  final double expRate;
  final int currentTeamRank;

  const _TeamExpRate({
    Key? key,
    required this.expRate,
    required this.currentTeamRank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double teamRate = expPythagorean(
    //   runs: runScores,
    //   earedRuns: eRunScores,
    // );

    return Row(
      children: [
        Text(
          '$currentTeamRank위팀 기대승률',
        ),
        const SizedBox(
          width: 8,
        ),
        Text(expRate.toString()
            // ((teamRate * 1000).floor() / 10).toString(),
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
