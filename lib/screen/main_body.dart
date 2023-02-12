import 'package:ballgame/component/playoff_bottom_sheet.dart';
import 'package:ballgame/constant/color.dart';
import 'package:ballgame/screen/exp_rate_input.dart';
// import 'package:ballgame/screen/expected_rate.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                '플레이오프 계산기',
                style: TextStyle(
                  fontSize: 36,
                  color: RED_COLOR,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                '우리팀은 가을야구를 할 수 있을까?',
                style: TextStyle(
                  fontSize: 18,
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'asset/img/main_logo.png',
                height: 200,
              ),
              const SizedBox(height: 36),
              const Text(
                '득점수와 실점수는 KBO 기록실의 팀기록에서 확인하세요',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: TEXT_COLOR,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '득점 : 팀기록 타자 지표 중 R / 실점 : 팀기록 투수 지표 중 R',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey[300],
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderElevatedButton(context),
                    const SizedBox(
                      height: 12,
                    ),
                    renderElevatedButton_2(context),
                    // const SizedBox(width: 20),
                    // renderElevatedButton(context)
                  ],
                ),
              )
            ],
          )),
    );
  }
}

ElevatedButton renderElevatedButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
      elevation: 2,
    ),
    onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return const PlayoffBottomSheet();
        },
      );
    },
    child: SizedBox(
      width: 200,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sports_baseball),
          SizedBox(width: 16),
          Text(
            '플레이오프 확률',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}

ElevatedButton renderElevatedButton_2(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
      elevation: 2,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExpRateInput(),
        ),
      );
    },
    child: SizedBox(
      width: 200,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sports_baseball_outlined),
          SizedBox(width: 16),
          Text(
            '팀 별 기대 승률',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
