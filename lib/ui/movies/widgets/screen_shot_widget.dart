import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';

class ScreenShotWidget extends StatelessWidget {
  const ScreenShotWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imagePath,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: AppColor.gray,
          ),
        ),
        errorWidget: (context, url, error) =>
            Center(child: Image.asset(AppAssets.errorImage)),
      ),
    );
  }
}
