import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/profile_widgets/rate_widget.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';

class MovieProfileItem extends StatelessWidget{
  String? imageUrl;
  num? rate;
  MovieProfileItem({super.key, required this.imageUrl, required this.rate});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
   return Stack(
     children: [
       Container(
         clipBehavior: Clip.antiAlias,
         height: height * 0.1931,
         width: width * 0.283,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16)
         ),
         child: CachedNetworkImage(
           fit: BoxFit.fill,
           imageUrl: imageUrl??'',
           placeholder: (context, url) => const Center(
             child: CircularProgressIndicator(
               color: AppColor.gray,
             ),
           ),
           errorWidget: (context, url, error) =>
               Center(child: Image.asset(AppAssets.errorImage)),
         ),
       ),
       RateWidget(rate: rate ?? 0.0),
     ],
   );

  }

}