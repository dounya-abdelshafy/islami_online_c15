import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  static const String routeName = 'Sura_Details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text('data'),
      ),
    );
  }
}
