import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/movies/movie_poster_rate_widget.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: height * .6,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/onboardingS2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.transparent,
                        AppColor.black,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppAssets.availableNow),
                      CarouselSlider.builder(
                          itemCount: 6,
                          itemBuilder: (context, index, realIndex) {
                            return MoviePosterRateWidget(
                                imagePath:
                                    'assets/images/onboardingS${index + 1}.png',
                                rate: 7.8);
                          },
                          options: CarouselOptions(
                            height: height * 0.35,
                            viewportFraction: 0.43,
                            initialPage: 6,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.25,
                          )),
                      Image.asset(AppAssets.watchNow),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Action ",
                    style: AppStyles.normal20white,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More ->",
                        style: AppStyles.normal16primary,
                      )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print(index.toString());
                   return MoviePosterRateWidget(
                        imagePath:
                            'assets/images/onboardingS${index + 1}.png',
                        rate: 7.9
                   );
                  },
                  itemCount: 6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
