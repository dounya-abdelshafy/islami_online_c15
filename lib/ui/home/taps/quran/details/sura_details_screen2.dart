import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/home/taps/quran/quran_resources.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_assets.dart';

class SuraDetails2 extends StatefulWidget {
  const SuraDetails2({super.key});

  static const String routeName = 'Sura_Details_Screen2';

  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              SizedBox(height: height * 0.03),

              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                            TextSpan(
                              children: verses.asMap().entries.map((entry) {
                                int index = entry.key;
                                String verses = entry.value.trim();
                                return TextSpan(
                                  text: "$verses ﴿${index + 1}﴾ ",
                                  style: AppStyles.bold20Primary,
                                );
                              }).toList(),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
