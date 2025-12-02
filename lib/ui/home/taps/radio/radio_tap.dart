import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/taps/radio/radio_widget/radio_reciters_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioTap extends StatefulWidget {
  RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: RadioCustomWidget(
                  title: 'Radio',
                  active: selectedIndex == 0,
                  onTap: () {
                    if (selectedIndex == 0) return;
                    selectedIndex = 0;
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: RadioCustomWidget(
                  title: 'Reciters',
                  active: selectedIndex == 1,
                  onTap: () {
                    if (selectedIndex == 1) return;
                    selectedIndex = 1;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return RadioRecitersWidget();
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.02);
              },
            ),
          ),
        ],
      ),
    );
  }
}

InkWell RadioCustomWidget({
  required String title,
  required bool active,
  required void Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: AlignmentGeometry.center,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryColor : AppColors.blackBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: active ? AppStyles.bold16Black : AppStyles.normal16White,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
