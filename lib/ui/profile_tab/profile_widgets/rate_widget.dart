import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class RateWidget extends StatelessWidget {
  num? rate;
  RateWidget({required this.rate});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.1316,
      height: height * 0.029,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.semiBlack.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$rate",
            style: AppStyles.normal16white
          ),
           SizedBox(
            width: width * 0.011
          ),
          ImageIcon(
            AssetImage(AppAssets.starIcon),
            color: AppColor.orange,
            size: 15,
          )
        ],
      ),
    );
  }
}
