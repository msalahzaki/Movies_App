import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_states.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_viewModel.dart';
import 'package:movies_app/ui/profile_tab/history_tab/history_tab.dart';
import 'package:movies_app/ui/profile_tab/update_profile/update_profile.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/watchList_tab.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProfileTabViewmodel profileTabViewModel = BlocProvider.of<ProfileTabViewmodel>(context);
    profileTabViewModel.loginViewModel = BlocProvider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.semiBlack,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<ProfileTabViewmodel, ProfileTabStates>(
                  bloc: profileTabViewModel..getProfile(token: profileTabViewModel.loginViewModel?.userToken),
                  builder: (context, state) {
                    if (state is GetProfileLoadingState) {
                      return CircularProgressIndicator(color: AppColor.orange,);
                    } else  {
                      return Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 50,
                            child: Image.asset(
                              AppAssets.avatarImages[
                              (profileTabViewModel.currentUser!.data!.avaterId ?? 1) -
                                  1],
                            ),
                          ),
                          SizedBox(
                            width: width * .4,
                            child: Text(
                              profileTabViewModel.currentUser!.data!.name ?? "",
                              style: AppStyles.bold20white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                Text(textAlign: TextAlign.center,
                  "12 \n Wish List",
                  style: AppStyles.bold24white,
                ),
                Text( textAlign: TextAlign.center,
                  "10 \n History",
                  style: AppStyles.bold24white,
                )
              ],
            ),
              SizedBox(
                height: height * .03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.037,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UpdateProfile(),));
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
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
                          },
                          child: Text(
                            "Exit > ",
                            style: AppStyles.normal20white,
                          )),
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                  length: 2,
                  child: TabBar(
                    onTap: (index) {
                      profileTabViewModel.changeSelectedIndex(index);
                      print(profileTabViewModel.selectedIndex);
                    },
                    tabs: [
                      Tab(
                        iconMargin: const EdgeInsets.all(8),
                        icon: Image.asset(AppAssets.watchListIcon),
                        text: "Watch List",
                      ),
                      Tab(
                        iconMargin: const EdgeInsets.all(8),
                        icon: Image.asset(AppAssets.historyIcon),
                        text: "History",
                      ),
                    ],
                  )
              ),
              BlocBuilder<ProfileTabViewmodel, ProfileTabStates>(
                bloc: profileTabViewModel,
                builder: (context, state) {
                return profileTabViewModel.selectedIndex == 0 ?
                    WatchlistTab() : HistoryTab();
              },
              )
            ],
          ),
        ),
    );

  }
}
