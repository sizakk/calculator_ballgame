import 'dart:io';

import 'package:ballgame/constant/adIDs.dart';
import 'package:ballgame/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  BannerAd? banner;

  @override
  void initState() {
    super.initState();

    banner = BannerAd(
      listener: const BannerAdListener(),
      size: AdSize.banner,
      adUnitId: Platform.isIOS ? iOSTestUnitId : androidTestUnitId,
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    // 종료시 광고를 닫는다.
    banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACK_COLOR,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                color: BACK_COLOR,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_sharp),
                      ),
                      const Text(
                        ' 팀 득점/실점 확인',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Image.asset(
                    'asset/img/kbo_2x.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              _ADs(
                banner: banner,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ADs extends StatelessWidget {
  const _ADs({
    required this.banner,
  });

  final BannerAd? banner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: banner == null
          ? Container()
          : AdWidget(
              ad: banner!,
            ),
    );
  }
}
