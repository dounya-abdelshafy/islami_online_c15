import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_app/ui/home/taps/hadith/hadeth_item.dart';

class HadithTap extends StatelessWidget {
  const HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.02),
      child: CarouselSlider(
        options: CarouselOptions(
          height: height * 0.66,
          enlargeCenterPage: true,
        ),
        items: List.generate(50, (index) => index + 1).map((index) {
          return HadethItem(index: index);
        }).toList(),
      ),
    );
  }
}
