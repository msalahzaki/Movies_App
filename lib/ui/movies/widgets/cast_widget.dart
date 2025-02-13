import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';

class CastWidget extends StatelessWidget {
  const CastWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.character});

  final String imagePath;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.005),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppColor.semiBlack),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imagePath,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.gray,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AppAssets.errorImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : $name',
                    style: AppStyles.light20White,
                  ),
                  Text(
                    'Character : $character',
                    style: AppStyles.light20White,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
