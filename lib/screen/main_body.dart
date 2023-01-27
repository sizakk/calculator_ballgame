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
            const SizedBox(height: 60),
            Image.asset(
              'asset/img/logo.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              '가을야구 확률 계산기',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 120),
            SizedBox(
              height: 100,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    renderElevatedButton(context),
                    const SizedBox(width: 20),
                    renderElevatedButton(context)
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
      backgroundColor: BLUE_COLOR,
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
    child: const Icon(Icons.sports_baseball),
  );
}
