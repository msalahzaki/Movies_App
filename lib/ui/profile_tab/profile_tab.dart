import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_states.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_viewModel.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_states.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_view_model.dart';
import 'package:movies_app/ui/profile_tab/history_tab/history_tab.dart';
import 'package:movies_app/ui/profile_tab/update_profile/update_profile.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_view_model.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/watchList_tab.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';


class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late ProfileTabViewmodel profileTabViewModel ;
  WatchListViewModel watchListViewModel = WatchListViewModel();
  HistoryTabViewModel historyTabViewModel = HistoryTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileTabViewModel = BlocProvider.of<ProfileTabViewmodel>(context);
    profileTabViewModel.selectedIndex = 0;
    watchListViewModel.getFavorites();
    historyTabViewModel.getAllMoviesFromHistory();
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                SizedBox(
                  height: height * 0.15,
                  width: width * 0.3720,
                  child: BlocBuilder<ProfileTabViewmodel, ProfileTabStates>(
                    bloc: profileTabViewModel..getProfile(token: profileTabViewModel.loginViewModel?.userToken),
                    builder: (context, state) {
                      if (state is GetProfileLoadingState) {
                        return const Center(child: CircularProgressIndicator(color: AppColor.orange,
                        strokeWidth: 3,));
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
                              height: height * .005,
                            ),
                            Expanded(
                              child: SizedBox(
                                width: width * .4,
                                  child: Text(
                                  profileTabViewModel.currentUser!.data!.name ?? "",
                                  style: AppStyles.bold20white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                Column(
                  children: [
                    BlocBuilder<WatchListViewModel,WatchListStates>(
                      bloc: watchListViewModel,
                      builder: (context, state) {
                        if(state is WatchListLoadingState){
                          return const CircularProgressIndicator(
                                  color: AppColor.orange,
                                );
                        }else if(state is WatchListEmptyState){
                          return Text('0',style: AppStyles.bold24white,);
                        }else if(state is WatchListErrorState){
                          return Text('0',style: AppStyles.bold24white,);
                        }
                        else if (state is WatchListSuccessState){
                          return Text('${watchListViewModel.favoriteMoviesList.length}',
                          style: AppStyles.bold24white,);
                        }else{
                          return const CircularProgressIndicator(
                            color: AppColor.orange,
                          );
                        }
                      },
                      // child: Text(textAlign: TextAlign.center,
                      //   "12",
                      //   style: AppStyles.bold24white,
                      // ),
                    ),
                    Text(textAlign: TextAlign.center,
                      "Wish List",
                      style: AppStyles.bold24white,
                    ),
                  ],
                ),
                Column(
                  children: [
                    BlocBuilder<HistoryTabViewModel,HistoryTabStates>(
                      bloc: historyTabViewModel,
                      builder: (context, state) {
                        if(state is HistoryTabLoadingState){
                          return const CircularProgressIndicator(
                            color: AppColor.orange,
                          );
                        }else if(state is HistoryTabEmptyState){
                          return Text('0',style: AppStyles.bold24white,);
                        }else if(state is WatchListErrorState){
                          return Text('0',style: AppStyles.bold24white,);
                        }
                        else if (state is HistoryTabSuccessState){
                          return Text('${historyTabViewModel.historyList.length}',
                            style: AppStyles.bold24white,);
                        }else{
                          return const CircularProgressIndicator(
                            color: AppColor.orange,
                          );
                        }
                      },
                      // child: Text(textAlign: TextAlign.center,
                      //   "12",
                      //   style: AppStyles.bold24white,
                      // ),
                    ),
                    Text(textAlign: TextAlign.center,
                      "History",
                      style: AppStyles.bold24white,
                    ),
                  ],
                ),
              ],
            ),
              SizedBox(
                height: height * .01,
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
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
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
                    WatchlistTab(watchListViewModel) :  HistoryTab(historyTabViewModel);
              },
              )
            ],
          ),
        ),
    );

  }
}
