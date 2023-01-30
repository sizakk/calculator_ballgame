import 'package:ballgame/component/back_button.dart';
import 'package:ballgame/component/custom_text_field.dart';
import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

class ExpectedRate extends StatelessWidget {
  const ExpectedRate({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: BACK_COLOR,
          body: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  Row(children: [
                    CustomTextField(
                      isTeamName: false,
                     isNums: true, isGames: false, label: 'false', onSaved: onSaved,)
                  ],)
                  color: BACK_COLOR,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  child: renderBackButton(context),
                ),
              )
            ],
          )),
    );
  }
}
