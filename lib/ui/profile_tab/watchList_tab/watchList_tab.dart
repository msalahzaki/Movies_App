import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/ui/profile_tab/profile_widgets/movie_profile_item.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_view_model.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class WatchlistTab extends StatefulWidget {


  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  WatchListViewModel viewModel = WatchListViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loginViewModel = BlocProvider.of<LoginViewModel>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<WatchListViewModel,WatchListStates>(
      bloc: viewModel..getFavoriteList(token: viewModel.loginViewModel?.userToken),
      builder: (context, state) {
        if(state is LoadingLoginState){
          return const Expanded(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColor.orange,
                ),
              ),
            ),
          );
        }else if(state is WatchListEmptyState){
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Image.asset(AppAssets.emptyBG),
              ),
            ),
          );
        }else if(state is WatchListErrorState){
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Text(state.errorMessage,style: AppStyles.normal20white,),
              ),
            ),
          );
        }
        else if (state is WatchListSuccessState){
          return Expanded(
            child: Scaffold(
                body: GridView.builder(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: width * 0.037,
                    vertical: height * 0.025,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 61/90,
                      mainAxisSpacing: height * 0.017,
                      crossAxisSpacing: width * 0.037
                  ),
                  itemBuilder: (context, index) {
                    return MovieProfileItem(
                      imageUrl: viewModel.favoriteMoviesList[index].imageURL,
                      rate: viewModel.favoriteMoviesList[index].rating,
                    );
                  },
                  itemCount: viewModel.favoriteMoviesList.length,
                )
            ),
          );
        }else{
          return const Expanded(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColor.orange,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
// Center(
// child: Image.asset(AppAssets.emptyBG),
// ),