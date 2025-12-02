import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/taps/quran/most_recent_widget.dart';
import 'package:islami_app/ui/home/taps/quran/quran_resources.dart';
import 'package:islami_app/ui/home/taps/quran/sura_item.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_pref.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import 'details/sura_details_screen2.dart';

/*
width = 430
height = 932
 */

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filterList = List.generate(114, (index) => index);

  // List<int> searchList = [];

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
            style: AppStyles.bold16White,
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
            onChanged: (newText) {
              searchByNewText(newText);
            },
          ),

          SizedBox(height: height * 0.02),

          MostRecentWidget(),

          SizedBox(height: height * 0.01),

          Text("Sura's List", style: AppStyles.bold16White),

          SizedBox(height: height * 0.01),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: save last sura index in shared pref
                    saveNewSuraList(filterList[index]);
                    //todo: navigate to Sura Details Screen
                    Navigator.of(context).pushNamed(
                      SuraDetails2.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.04,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.arabicQuranList[i].toLowerCase().contains(newText)) {
        filterSearchList.add(i);
      }
      if (QuranResources.englishQuranList[i].toLowerCase().contains(newText)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
