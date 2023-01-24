import 'package:ballgame/component/rate_card.dart';
import 'package:ballgame/constant/color.dart';
import 'package:ballgame/screen/main_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACK_COLOR,
        body: Center(
          child: Column(
            children: const [
              MainBody(),
              Text('data!'),
              SizedBox(
                height: 50,
              ),
              RateCard(
                myteam: '롯데자이언츠',
                games: 34,
                wins: 15,
                runs: 175,
                earendRuns: 192,
              )
            ],
          ),
        ),
      ),
    );
  }
}
