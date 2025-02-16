import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_states.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_view_model.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/custom_dailog.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';
import '../../movies/movie_details_screen.dart';
import '../profile_widgets/movie_profile_item.dart';

class HistoryTab extends StatefulWidget {
  HistoryTab(this.viewModel, {super.key});
  HistoryTabViewModel viewModel;
  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.viewModel.getAllMoviesFromHistory();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HistoryTabViewModel, HistoryTabStates>(
      bloc: widget.viewModel,
      builder: (context, state) {
        if (state is HistoryTabLoadingState) {
          return const Expanded(
            child: Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColor.orange,
                ),
              ),
            ),
          );
        } else if (state is HistoryTabEmptyState) {
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Image.asset(AppAssets.emptyBG),
              ),
            ),
          );
        } else if (state is HistoryTabErrorState) {
          return Expanded(
            child: Scaffold(
              body: Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.normal20white,
                ),
              ),
            ),
          );
        } else if (state is HistoryTabSuccessState) {
          return Expanded(
            child: Scaffold(
                body: GridView.builder(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * 0.037,
                vertical: height * 0.025,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 61 / 90,
                  mainAxisSpacing: height * 0.017,
                  crossAxisSpacing: width * 0.037),
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            title: "Remove From History",
                            desc:
                                "You are about to remove this movie From History",
                            dismissOnTouchOutside: false,
                      btnOkText: "Remove It",
                      btnCancelOnPress: (){},
                      btnOkOnPress: (){
                        widget.viewModel.RemoveMoviesFromHistory(widget.viewModel.historyList[index].id!);

                      },

                    )
                        .show();
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                              movieId: widget.viewModel.historyList[index].id
                                  .toString()),
                        ));
                  },
                  child: MovieProfileItem(
                    imageUrl:
                        widget.viewModel.historyList[index].largeCoverImage,
                    rate: widget.viewModel.historyList[index].rating,
                  ),
                );
              },
              itemCount: widget.viewModel.historyList.length,
            )),
          );
        } else {
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
