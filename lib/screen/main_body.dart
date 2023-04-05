import 'dart:io';

import 'package:ballgame/component/playoff_bottom_sheet.dart';
import 'package:ballgame/constant/adIDs.dart';
import 'package:ballgame/constant/color.dart';
import 'package:ballgame/screen/exp_rate_input.dart';
import 'package:ballgame/screen/helpe_page.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late final InterstitialAd interstitialAd;

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ADs(
              banner: banner,
            ),
            const _Header(),
            const SizedBox(height: 36),
            const _Body(),
            const SizedBox(height: 16),
            const _Footer(),
          ],
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

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              renderElevatedButton(context),
              const SizedBox(
                height: 12,
              ),
              renderElevatedButton_2(context),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'asset/img/main_logo.png',
          height: 200,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          '득점수와 실점수는 KBO 기록실의 팀기록에서 확인하세요',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: TEXT_COLOR,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '득점 : 팀기록 타자 지표 중 R / 실점 : 팀기록 투수 지표 중 R',
          style: TextStyle(
            fontSize: 12,
            color: Colors.blueGrey[300],
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 26,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.help),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '기록 확인 방법',
                      style: TextStyle(
                        color: TEXT_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text('KBO 기록실 바로가기')
          ],
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        Text(
          '가을야구 계산기',
          style: TextStyle(
            fontSize: 36,
            color: RED_COLOR,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '우리팀은 가을야구를 할 수 있을까?',
          style: TextStyle(
            fontSize: 18,
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

ElevatedButton renderElevatedButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
      elevation: 2,
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
    child: SizedBox(
      width: 200,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Icon(Icons.sports_baseball),
          SizedBox(width: 16),
          Text(
            '플레이오프 확률',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

ElevatedButton renderElevatedButton_2(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: TEXT_COLOR,
      elevation: 2,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExpRateInput(),
        ),
      );
    },
    child: SizedBox(
      width: 200,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Icon(Icons.sports_mma),
          SizedBox(width: 1),
          Text(
            '팀 기대 승률',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}
