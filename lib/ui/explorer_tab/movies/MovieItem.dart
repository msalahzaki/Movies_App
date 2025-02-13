import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class MovieItem extends StatelessWidget {
  Movies moviesobj;
  MovieItem({
    required this.moviesobj,
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CachedNetworkImage(
              height: height * .29,
              width: width * 0.43,
              fit: BoxFit.fill,
              imageUrl: "${moviesobj.largeCoverImage}",
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02, top: height * 0.01),
              child: Container(
                height: height * 0.05,
                width: width * .21,
                decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.71),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${moviesobj.rating}",
                        style: AppStyles.normal14white,
                        overflow:
                            TextOverflow.ellipsis, // Prevents text overflow
                      ),
                      SizedBox(width: width * 0.01), // Small spacing

                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.002),
                        child: Image.asset(AppAssets.starIcon,
                            width: width * 0.06),
                      ), // Limit size
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
