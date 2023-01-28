// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (e) => Image.asset(
              'asset/img/$e.png',
              width: 60.0,
              height: 80.0,
            ),
          )
          .toList(),
    );
  }
}
