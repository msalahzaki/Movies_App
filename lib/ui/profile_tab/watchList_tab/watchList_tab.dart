import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/ui/profile_tab/profile_widgets/movie_profile_item.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_view_model.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';

class WatchlistTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    WatchListViewModel viewModel = WatchListViewModel();
    viewModel.loginViewModel = BlocProvider.of<LoginViewModel>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder(
      bloc: viewModel..getFavoriteList(token: viewModel.loginViewModel!.userToken),
      builder: (context, state) {
        if(state is LoadingLoginState){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColor.orange,
              ),
            ),
          );
        }else if(state is WatchListEmptyState){
          return Scaffold(
            body: Center(
              child: Image.asset(AppAssets.emptyBG),
            ),
          );
        }else{
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
                      imageUrl: viewModel.favoriteMoviesList![index].imageURL,
                      rate: viewModel.favoriteMoviesList![index].rating,
                    );
                  },
                  itemCount: viewModel.favoriteMoviesList!.length,
                )
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