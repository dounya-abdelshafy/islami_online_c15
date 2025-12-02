import 'package:flutter/material.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/home/taps/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  @override
  void initState() {
    //todo: this block of code can be execute before build
    super.initState();
    //todo: this block of code can be execute after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getMostRecentSuraList();
    });
  }

  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            QuranResources.englishQuranList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            QuranResources.arabicQuranList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            "${QuranResources.versesNumberList[mostRecentProvider.mostRecentList[index]]} Verses",
                            style: AppStyles.bold14Black,
                          ),
                        ],
                      ),
                      ImageIcon(AssetImage(AppAssets.suraImage), size: 130),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
