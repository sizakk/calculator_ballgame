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
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '돌아가기',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}
