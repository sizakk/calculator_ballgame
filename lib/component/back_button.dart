import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';

ElevatedButton renderBackButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
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
            '첫 화면으로',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  );
}
