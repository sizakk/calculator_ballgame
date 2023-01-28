import 'package:ballgame/component/playoff_bottom_sheet.dart';
import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              '#플레이오프 계산기',
              style: TextStyle(
                fontSize: 30,
                color: RED_COLOR,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '우리팀은 가을야구를 할 수 있을까?',
              style: TextStyle(
                fontSize: 16,
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'asset/img/logo.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              '득점수와 실점수는 \n KBO 기록실에서 확인하세요',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 100,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderElevatedButton(context),
                    // const SizedBox(width: 20),
                    // renderElevatedButton(context)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

ElevatedButton renderElevatedButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
      elevation: 4,
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
          SizedBox(width: 8),
          Text(
            '계산해보기!',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    ),
  );
}
