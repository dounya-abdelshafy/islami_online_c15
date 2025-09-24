import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/taps/quran/quran_resources.dart';
import 'package:islami_app/ui/home/taps/quran/sura_details.dart';
import 'package:islami_app/ui/home/taps/quran/sura_item.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

/*
width = 430
height = 932
 */

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.iconQuran),
                color: AppColors.primaryColor,
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              // hintStyle: Theme.of(context).textTheme.headlineLarge,
            ),
            cursorColor: AppColors.primaryColor,
          ),

          SizedBox(height: height * 0.02),

          Text("Most Recently", style: AppStyles.bold16White),

          SizedBox(height: height * 0.01),

          SizedBox(
            height: height * 0.17,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 10),
                              Text(
                                QuranResources.englishQuranList[index],
                                style: AppStyles.bold24Black,
                              ),
                              Text(
                                QuranResources.arabicQuranList[index],
                                style: AppStyles.bold24Black,
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                "${QuranResources.versesNumberList[index]} Verses",
                                style: AppStyles.bold14Black,
                              ),
                            ],
                          ),
                          ImageIcon(AssetImage(AppAssets.suraImage), size: 130),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: 114,
            ),
          ),

          SizedBox(height: height * 0.01),

          Text("Sura's List", style: AppStyles.bold16White),

          SizedBox(height: height * 0.01),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to Sura Details Screen
                    SuraDetails();
                  },
                  child: SuraItem(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.05,
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }
}
