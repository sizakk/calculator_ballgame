// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ballgame/constant/color.dart';

class _WinHuddle extends StatelessWidget {
  final int winNums;

  const _WinHuddle({
    required this.winNums,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: RED_COLOR,
        shape: BoxShape.rectangle,
      ),
      width: 34,
      height: 16,
      child: Text(
        '$winNums',
        textAlign: TextAlign.center,
      ),
    );
  }
}
