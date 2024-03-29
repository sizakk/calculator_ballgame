// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ballgame/component/calculates.dart';
import 'package:ballgame/component/exp_rate_card.dart';
import 'package:ballgame/constant/color.dart';
import 'package:ballgame/screen/home_screen.dart';
import 'package:flutter/material.dart';

class ExpResult extends StatelessWidget {
  final int runScores_1;
  final int eRunScores_1;
  final int runScores_2;
  final int eRunScores_2;
  final int runScores_3;
  final int eRunScores_3;
  final int runScores_4;
  final int eRunScores_4;
  final int runScores_5;
  final int eRunScores_5;
  final int runScores_6;
  final int eRunScores_6;
  final int runScores_7;
  final int eRunScores_7;
  final int runScores_8;
  final int eRunScores_8;
  final int runScores_9;
  final int eRunScores_9;
  final int runScores_10;
  final int eRunScores_10;

  const ExpResult({
    Key? key,
    required this.runScores_1,
    required this.eRunScores_1,
    required this.runScores_2,
    required this.eRunScores_2,
    required this.runScores_3,
    required this.eRunScores_3,
    required this.runScores_4,
    required this.eRunScores_4,
    required this.runScores_5,
    required this.eRunScores_5,
    required this.runScores_6,
    required this.eRunScores_6,
    required this.runScores_7,
    required this.eRunScores_7,
    required this.runScores_8,
    required this.eRunScores_8,
    required this.runScores_9,
    required this.eRunScores_9,
    required this.runScores_10,
    required this.eRunScores_10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> rankList = [
      expPythagorean(
        runs: runScores_1,
        earedRuns: eRunScores_1,
      ),
      expPythagorean(
        runs: runScores_2,
        earedRuns: eRunScores_2,
      ),
      expPythagorean(
        runs: runScores_3,
        earedRuns: eRunScores_3,
      ),
      expPythagorean(
        runs: runScores_4,
        earedRuns: eRunScores_4,
      ),
      expPythagorean(
        runs: runScores_5,
        earedRuns: eRunScores_5,
      ),
      expPythagorean(
        runs: runScores_6,
        earedRuns: eRunScores_6,
      ),
      expPythagorean(
        runs: runScores_7,
        earedRuns: eRunScores_7,
      ),
      expPythagorean(
        runs: runScores_8,
        earedRuns: eRunScores_8,
      ),
      expPythagorean(
        runs: runScores_9,
        earedRuns: eRunScores_9,
      ),
      expPythagorean(
        runs: runScores_10,
        earedRuns: eRunScores_10,
      ),
    ];

    List<double> sortedList = List.from(rankList);
    sortedList.sort((a, b) => b.compareTo(a));

    Map<int, double> rankMap = {};

    for (int i = 0; i < sortedList.length; i++) {
      rankMap[i] = sortedList[i];
    }

    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BACK_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Container(
                height: 100,
                color: BACK_COLOR,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '# 가을야구 계산기',
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
                      '# 플레이오프 확률',
                      style: TextStyle(
                        color: RED_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                child: Container(
                  color: BACK_COLOR,
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: 10,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16.0,
                            );
                          },
                          itemBuilder: (context, index) {
                            int e = index + 1;
                            int getRank = rankMap.keys.firstWhere(
                              (k) => rankMap[k] == rankList[index],
                            );

                            return ExpRateCard(
                              currentTeamRank: e,
                              expRate: (rankList[index] * 1000).floor() / 10,
                              expTeamRank: getRank + 1,
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$year시즌   $month.$day',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TEXT_COLOR,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      '다시 입력하기',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TEXT_COLOR,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text(
                      '첫 페이지로',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
