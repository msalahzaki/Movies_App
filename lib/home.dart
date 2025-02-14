import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/explorer_tab/explorer_tab.dart';
import 'package:movies_app/ui/home_tab/home_tab.dart';
import 'package:movies_app/ui/profile_tab/profile_tab.dart';
import 'package:movies_app/ui/search_tab/search_tab.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'cubit/bottomNavigation_cubit.dart';

class Home extends StatelessWidget {
  static const String homeScreenId = "HomeScreen";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BottomNavigationCubit(), // Provide Cubit at a higher level
      child: HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});

  final List<Widget> tabs = [
    const HomeTab(),
     SearchTab(),
    ExplorerTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return tabs[state];
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BlocBuilder<BottomNavigationCubit, int>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: state,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  context
                      .read<BottomNavigationCubit>()
                      .changeNavigationWidget(index); // Update tab
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppAssets.searchIcon)),
                      label: "Search"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppAssets.exploreIcon)),
                      label: "Explorer"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
                      label: "Profile"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
