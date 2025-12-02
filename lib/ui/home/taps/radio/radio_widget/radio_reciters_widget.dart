import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioRecitersWidget extends StatelessWidget {
  RadioRecitersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(
          alignment: AlignmentDirectional.bottomCenter,
          image: AssetImage(AppAssets.radioMosque),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        spacing: 18,
        children: [
          Text('Radio Ibrahim Al-Akdar', style: AppStyles.bold20Black),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Icon(Icons.stop_rounded, size: 35, color: AppColors.blackColor),
              Icon(
                Icons.play_arrow_rounded,
                size: 55,
                color: AppColors.blackColor,
              ),
              Icon(Icons.volume_up, size: 32, color: AppColors.blackColor),
            ],
          ),
        ],
      ),
    );
  }
}
