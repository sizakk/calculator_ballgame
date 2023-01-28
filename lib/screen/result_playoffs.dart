// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/constant/color.dart';
import 'package:data/data.dart';
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
    int playoffsRate = (100 *
            (1 -
                (BinomialDistribution(trials, expP)
                    .cumulativeProbability(71 - winsNums - 1))))
        .floor();

    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: TEXT_COLOR,
      fontSize: 14,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: BACK_COLOR,
        body: winsNums <= gamesNums
            ? ResultNoError(
                teamName: teamName,
                textStyle: textStyle,
                trials: trials,
                expP: expP,
                playoffsRate: playoffsRate,
              )
            : const GetError(),
      ),
    );
  }
}

class ResultNoError extends StatelessWidget {
  const ResultNoError({
    Key? key,
    required this.teamName,
    required this.playoffsRate,
    required this.textStyle,
    required this.trials,
    required this.expP,
  }) : super(key: key);

  final String teamName;
  final TextStyle textStyle;
  final int trials;
  final int playoffsRate;
  final double expP;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teamName,
            style: const TextStyle(
              color: PRIMARY_COLOR,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '플레이오프 진출 확률',
            style: textStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            playoffsRate.toString(),
          ),
          const SizedBox(
            height: 26,
          ),
          Text(
            '남은 $trials 경기\n기대승률 ${expP * 100}%',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 36,
          ),
          renderBakcButton(context)
        ],
      ),
    );
  }
}

class GetError extends StatelessWidget {
  const GetError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '계산 실패',
            style: TextStyle(
              color: RED_COLOR,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            ': 경기 수 보다 승수가 많습니다',
            style: TextStyle(
              color: TEXT_COLOR,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          renderBakcButton(context),
        ],
      ),
    );
  }
}

ElevatedButton renderBakcButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: BLUE_COLOR,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: SizedBox(
      width: 160,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '다시 계산하기',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
