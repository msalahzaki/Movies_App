import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class MovieLikesDurationRateWidget extends StatelessWidget {
  const MovieLikesDurationRateWidget({super.key, required this.iconPath, required this.text});
final String iconPath;
final String text;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .3,
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.semiBlack,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
         Image.asset(iconPath),
          SizedBox(width: width*.02,),
          Text(text,style: AppStyles.normal20white,)
        ],
      ),
    );
  }
}
