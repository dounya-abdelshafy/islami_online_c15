import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = 'onBoarding_Screen';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return IntroductionScreen(
      globalBackgroundColor: AppColors.blackColor,
      pages: [
        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(AppAssets.logo, height: height * 0.28),

              Image.asset(AppAssets.introImage01, height: height * 0.28),
            ],
          ),

          bodyWidget: Column(
            children: [
              SizedBox(height: height * 0.15),
              Text("Welcome To Islami App", style: AppStyles.bold16Primary),
            ],
          ),

          decoration: const PageDecoration(pageColor: AppColors.blackColor),
        ),

        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(AppAssets.logo, height: height * 0.28),

              Image.asset(AppAssets.introImage02, height: height * 0.35),
            ],
          ),

          bodyWidget: Column(
            children: [
              Text("Welcome To Islami App", style: AppStyles.bold16Primary),
              SizedBox(height: height * 0.05),
              Text(
                "We Are Very Excited To Have You In Our Community",
                textAlign: TextAlign.center,
                style: AppStyles.bold16Primary,
              ),
            ],
          ),

          decoration: const PageDecoration(pageColor: AppColors.blackColor),
        ),

        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(AppAssets.logo, height: height * 0.28),

              Image.asset(AppAssets.introImage03, height: height * 0.32),
            ],
          ),

          bodyWidget: Column(
            children: [
              Text("Reading the Quran", style: AppStyles.bold16Primary),
              SizedBox(height: height * 0.08),
              Text(
                "Read, and your Lord is the Most Generous",
                style: AppStyles.bold16Primary,
              ),
            ],
          ),

          decoration: const PageDecoration(pageColor: AppColors.blackColor),
        ),

        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(AppAssets.logo, height: height * 0.29),

              Image.asset(AppAssets.introImage04, height: height * 0.31),
            ],
          ),

          bodyWidget: Column(
            children: [
              Text("Bearish", style: AppStyles.bold16Primary),
              SizedBox(height: height * 0.06),
              Text(
                "Praise the name of your Lord, the Most High",
                style: AppStyles.bold16Primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),

          decoration: const PageDecoration(pageColor: AppColors.blackColor),
        ),

        PageViewModel(
          titleWidget: Column(
            children: [
              Image.asset(AppAssets.logo, height: height * 0.28),

              Image.asset(AppAssets.introImage05, height: height * 0.30),
            ],
          ),

          bodyWidget: Column(
            children: [
              Text("Holy Quran Radio", style: AppStyles.bold16Primary),
              SizedBox(height: height * 0.07),
              Text(
                "You can listen to the Holy Quran Radio through the application for free and easily",
                style: AppStyles.bold16Primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),

          decoration: const PageDecoration(pageColor: AppColors.blackColor),
        ),
      ],
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      showBackButton: true,
      back: Text("Back", style: TextStyle(color: AppColors.primaryColor)),
      next: Text("Next", style: TextStyle(color: AppColors.primaryColor)),
      done: Text("Next", style: AppStyles.bold14Primary),
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeSize: const Size(22.0, 10.0),
        activeColor: AppColors.primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
