import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/model/onboarding_model.dart';

import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/custom_elevated_button.dart';


class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onBoarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  var onboardingList = OnboardingModel.getOnboardingList();
  var controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            CarouselSlider(
                carouselController: controller,
                items: onboardingList
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(e['image']!))),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Color.fromRGBO(8, 66, 80, 0),
                            Color.fromRGBO(8, 66, 80, 0.7),
                          ], begin: Alignment.topCenter)),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                    height: height * 0.8, aspectRatio: 1, viewportFraction: 1)),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: height * 0.03),
                  width: width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: AppColor.black),
                  child: Column(
                    children: [
                      Text(
                        onboardingList[currentIndex]['title']!,
                        style: AppStyles.bold24white,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        onboardingList[currentIndex]['description']!,
                        textAlign: TextAlign.center,
                        style: AppStyles.light20White,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomElevatedButton(
                          buttonText: currentIndex == onboardingList.length - 1
                              ? 'Finish'
                              : 'Next',
                          textStyle: AppStyles.medium20Black,
                          onButtonClicked: () {
                            setState(() {
                              if (currentIndex < onboardingList.length - 1) {
                                currentIndex += 1;
                                controller.nextPage();
                              } else {
                                Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.loginScreenId);
                              }
                            });
                          }),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      currentIndex != 0
                          ? CustomElevatedButton(
                          buttonText: 'Back',
                              textStyle: AppStyles.medium20Orange,
                              backgroundColor: AppColor.black,
                              onButtonClicked: () {
                                if (currentIndex > 0) {
                                  currentIndex -= 1;
                                  controller.previousPage();
                                  setState(() {});
                                }
                              })
                          : const SizedBox()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
