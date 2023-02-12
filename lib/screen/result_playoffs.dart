// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/component/back_button.dart';
import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/component/number_row.dart';
import 'package:ballgame/constant/color.dart';
import 'package:ballgame/constant/win_nums.dart';
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
    // int allGamesKBO = 144;
    List leagueSelected = playoffHuddle['KBO']!;

    double expP = expPythagorean(
      runs: runScores,
      earedRuns: earendRunScores,
    );

    int trials = allGamesKBO - gamesNums;
    int playoffsRate = (100 *
            (1 -
                (BinomialDistribution(trials, expP).cumulativeProbability(
                    leagueSelected.elementAt(0) - winsNums - 1))))
        .floor();

    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: TEXT_COLOR,
      fontSize: 14,
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: BACK_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: BACK_COLOR,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '# 플레이오프 계산기',
                        style: TextStyle(
                          color: RED_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '# 가을야구 확률',
                        style: TextStyle(
                          color: RED_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: winsNums <= gamesNums
                  ? ResultNoError(
                      teamName: teamName,
                      textStyle: textStyle,
                      trials: trials,
                      expP: expP,
                      playoffsRate: playoffsRate,
                    )
                  : const GetError(),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: renderBackButton(context),
              ),
            ),
          ],
        ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: PRIMARY_COLOR,
              fontSize: 42,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            '남은 $trials 경기 플레이오프 진출 확률',
            style: textStyle.copyWith(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 14,
              ),
              NumberRow(
                number: playoffsRate == 100
                    ? 99
                    : playoffsRate <= 0.1
                        ? 1
                        : playoffsRate,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                '%',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              )
            ],
          ),
          // Text(
          //   playoffsRate.toString(),
          // ),
          const SizedBox(
            height: 46,
          ),
          Text(
            '기대승률 ${double.parse(expP.toStringAsFixed(3)) * 100}%',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
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
        children: const [
          Text(
            '계산 실패',
            style: TextStyle(
              color: RED_COLOR,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            ': 경기 수 보다 승수가 많습니다',
            style: TextStyle(
              color: TEXT_COLOR,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
