import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class MoviePosterRateWidget extends StatelessWidget {
  const MoviePosterRateWidget(
      {super.key, required this.imagePath, required this.rate});
  final String imagePath;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
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
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: AppColor.semiBlack.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$rate",
                style: AppStyles.normal20white,
              ),
              const SizedBox(
                width: 10,
              ),
              ImageIcon(
                AssetImage(AppAssets.starIcon),
                color: AppColor.orange,
              )
            ],
          ),
        ),
      ],
    );
  }
}
