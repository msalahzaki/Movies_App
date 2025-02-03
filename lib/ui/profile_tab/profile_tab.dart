import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/update_profile/update_profile.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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
              SizedBox(
                height: height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50,
                        child: Image.asset(AppAssets.avatar2),
                      ),
                      Text(
                        "Mohamed Salah",
                        style: AppStyles.bold20white,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "12 \n",
                        style: AppStyles.bold24white,
                      ),
                      Text(
                        "Wish List",
                        style: AppStyles.bold24white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "10 \n",
                        style: AppStyles.bold24white,
                      ),
                      Text(
                        "History",
                        style: AppStyles.bold24white,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateProfile(),));
                        },
                        child: Text(
                          "Edit Profile",
                          style: AppStyles.normal20black,
                        )),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.red),
                        onPressed: () {},
                        child: Text(
                          "Exit > ",
                          style: AppStyles.normal20white,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: height * .03,
              ),
              DefaultTabController(
                  length: 2,
                  child: TabBar(dividerColor: AppColor.transparent,
                      indicatorColor: AppColor.orange,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppAssets.watchListIcon),
                            Text(
                              "Watch List",
                              style: AppStyles.normal20white,
                            )
                          ],
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AppAssets.historyIcon),
                            Text(
                              "History",
                              style: AppStyles.normal20white,
                            )
                          ],
                        ),
                      ])),

            ],
          ),
        ),
      ),
    );
  }
}
