import 'package:ballgame/screen/home_screen.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'NotoSans',
    ),
    home: const HomeScreen(),
  ));

  final a = const BinomialDistribution(110, 0.454).cumulativeProbability(55);
  print(1 - a);
}
