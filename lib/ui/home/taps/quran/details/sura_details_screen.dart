import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/home/taps/quran/details/sura_content_item.dart';
import 'package:islami_app/ui/home/taps/quran/quran_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_assets.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routeName = 'Sura_Details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),

      // body: Stack(
      //   alignment: Alignment.topCenter,
      //   children: [
      //     Container(
      //       color: AppColors.blackBgColor,
      //       child: Image(
      //         image: AssetImage(AppAssets.detailsBG),
      //         width: double.infinity,
      //         height: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(12.0),
      //       child: Text(QuranResources.arabicQuranList[index] , style: AppStyles.bold24Primary,),
      //     ),
      //     verses.isEmpty
      //         ? Center(
      //             child: CircularProgressIndicator(
      //               color: AppColors.primaryColor,
      //             ),
      //           )
      //         : ListView.builder(
      //             itemBuilder: (context, index) {
      //               return Text(verses[index]);
      //             },
      //             itemCount: verses.length,
      //           ),
      //   ],
      // ),
      body: Container(
        color: AppColors.blackBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.cornerLeft),
                  Text(
                    QuranResources.arabicQuranList[index],
                    style: AppStyles.bold24Primary,
                  ),
                  Image.asset(AppAssets.cornerRight),
                ],
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraContentItem(
                            suraContent: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.01);
                        },
                        itemCount: verses.length,
                      ),
              ),
              Image.asset(AppAssets.mosqueImage),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}
