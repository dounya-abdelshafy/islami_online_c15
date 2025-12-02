import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> tasbehWords = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];
  int counter = 0;
  int index = 0;
  double angle = 1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: height * 0.02),
        Center(
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: AppStyles.bold36White,
          ),
        ),
        SizedBox(height: height * 0.03),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: width * 0.25,
              child: Image.asset(AppAssets.sebhaDetails1),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.08),
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  GestureDetector(
                    onTap: handleTasbehCounter,
                    child: Transform.rotate(
                      angle: -angle,
                      child: Positioned(
                        left: width * 0.11,
                        child: Image.asset(AppAssets.sebhaDetails2),
                      ),
                    ),
                  ),
                  Column(
                    spacing: height * 0.02,
                    children: [
                      Text(tasbehWords[index], style: AppStyles.bold36White),
                      Text('$counter', style: AppStyles.bold36White),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void handleTasbehCounter() {
    setState(() {
      if (counter == 33) {
        index = (index + 1) % tasbehWords.length;
        counter = 0;
      } else {
        counter++;
      }
      angle += 10;
    });
  }

  // String zekrChange() {
  //   if (counter == 0) {
  //     return 'اضغط هنـا';
  //   }
  //   if (counter >= 1 && counter <= 33) {
  //     return 'سبحان الله';
  //   }
  //   if (counter >= 34 && counter <= 66) {
  //     return 'الحمد لله';
  //   }
  //   if (counter >= 67 && counter <= 99) {
  //     return 'لا إله إلا الله';
  //   }
  //   if (counter >= 100 && counter <= 132) {
  //     return 'الله أكبر';
  //   }
  //   return '';
  // }
}
