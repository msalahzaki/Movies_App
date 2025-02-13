import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_states.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_view_model.dart';
import 'package:movies_app/utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';
import '../../movies/movie_details_screen.dart';
import '../profile_widgets/movie_profile_item.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  HistoryTabViewModel viewModel = HistoryTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllMoviesFromHistory();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HistoryTabViewModel,HistoryTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if(state is HistoryTabLoadingState){
          return const Expanded(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColor.orange,
                ),
              ),
            ),
          );
        }else if(state is HistoryTabEmptyState){
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Image.asset(AppAssets.emptyBG),
              ),
            ),
          );
        }else if(state is HistoryTabErrorState){
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Text(state.errorMessage,style: AppStyles.normal20white,),
              ),
            ),
          );
        }
        else if (state is HistoryTabSuccessState){
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsScreen(
                                      movieId: viewModel.historyList[index].id.toString()),
                            ));
                      },
                      child: MovieProfileItem(
                        imageUrl: viewModel.historyList[index].largeCoverImage,
                        rate: viewModel.historyList[index].rating,
                      ),
                    );
                  },
                  itemCount: viewModel.historyList.length,
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
