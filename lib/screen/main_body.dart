import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: 300,
        height: 320,
        color: PRIMARY_COLOR,
      ),
    );
  }
}
