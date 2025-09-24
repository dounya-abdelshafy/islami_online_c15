import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/taps/hadith/hadith_tap.dart';
import 'package:islami_app/ui/home/taps/quran/quran_tap.dart';
import 'package:islami_app/ui/home/taps/radio/radio_tap.dart';
import 'package:islami_app/ui/home/taps/sebha/sebha_tap.dart';
import 'package:islami_app/ui/home/taps/time/time_tap.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // List<String> backgroundImages = [
  //   AppAssets.quranBg,
  //   AppAssets.hadithBg,
  //   AppAssets.sebhaBg,
  //   AppAssets.radioBg,
  //   AppAssets.timeBg,
  // ];

  List<Widget> taps = [
    QuranTap(),
    HadithTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    // //Note:
    // //todo: const => compile time 'full immutable (never can be changed)'
    // const int x =  3;
    // //todo: final => run time 'half immutable'
    // final int y;
    // y = 10;
    // //y = 3;

    return Stack(
      children: [
        Image.asset(
          getBackgroundImage(),
          // backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            // showUnselectedLabels: false,
            backgroundColor: AppColors.primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              buildBottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 0,
                  imageName: AppAssets.iconQuran,
                ),
                label: 'Quran',
              ),
              buildBottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 1,
                  imageName: AppAssets.iconHadith,
                ),
                label: 'Hadith',
              ),
              buildBottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 2,
                  imageName: AppAssets.iconSebha,
                ),
                label: 'Sebha',
              ),
              buildBottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 3,
                  imageName: AppAssets.iconRadio,
                ),
                label: 'Radio',
              ),
              buildBottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 4,
                  imageName: AppAssets.iconTime,
                ),
                label: 'Time',
              ),

              // BottomNavigationBarItem(
              //   icon: builtBottomNavigationBar(index: 0, imageName: AppAssets.iconQuran),
              //   label: 'Quran',
              // ),
              //
              // BottomNavigationBarItem(
              //   icon: builtBottomNavigationBar(index: 1, imageName: AppAssets.iconHadith),
              //   label: 'Hadith',
              // ),
              //
              // BottomNavigationBarItem(
              //   icon: builtBottomNavigationBar(index: 2, imageName: AppAssets.iconSebha),
              //   label: 'Sebha',
              // ),
              //
              // BottomNavigationBarItem(
              //   icon: builtBottomNavigationBar(index: 3, imageName: AppAssets.iconRadio),
              //   label: 'Radio',
              // ),
              //
              // BottomNavigationBarItem(
              //   icon: builtBottomNavigationBar(index: 4, imageName: AppAssets.iconTime),
              //   label: 'Time',
              // ),
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 35),
                Image.asset(AppAssets.logo),
                Expanded(child: QuranTap()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavigationBar({
    required int index,
    required String imageName,
  }) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(AssetImage(imageName)),
          )
        : ImageIcon(AssetImage(imageName));
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }

  String getBackgroundImage() {
    switch (selectedIndex) {
      case 0:
        return AppAssets.quranBg;
      case 1:
        return AppAssets.hadithBg;
      case 2:
        return AppAssets.sebhaBg;
      case 3:
        return AppAssets.radioBg;
      case 4:
        return AppAssets.timeBg;
      default:
        return AppAssets.quranBg;
    }
  }
}
