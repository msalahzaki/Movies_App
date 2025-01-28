import 'package:flutter/material.dart';
import 'package:movies_app/ui/onBoarding/onBoarding_screen.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/custom_elevated_button.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = 'start';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(AppAssets.onboardingS1))),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(30, 30, 30, 0),
                Color.fromRGBO(18, 19, 18, 0.5),
                Color.fromRGBO(18, 19, 18, 0.91)
              ], begin: Alignment.topCenter)),
            ),
          ),
          Positioned(
            bottom: height * 0.03,
            child: Column(

              children: [
                Text(
                  '     Find Your Next \nFavorite Movie Here',
                  style: AppStyles.normal36white,
                ),
                Text(
                  'Get access to a huge library of movies \nto suit all tastes. You will surely like it.',
                  style: AppStyles.light20semiWhite,
                ),
                CustomElevatedButton(
                    buttonText: 'Explore Now',
                    textStyle: AppStyles.medium20Black,
                    onButtonClicked: () {
                      Navigator.of(context)
                          .pushReplacementNamed(OnboardingScreen.routeName);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
