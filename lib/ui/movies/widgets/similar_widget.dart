import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/movies/cubit/similar_states.dart';
import 'package:movies_app/ui/movies/cubit/similar_view_model.dart';
import 'package:movies_app/ui/movies/movie_poster_rate_widget.dart';
import 'package:movies_app/utils/app_assets.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';

class SimilarWidget extends StatefulWidget {
  const SimilarWidget({super.key, required this.movieID});

  final String movieID;

  @override
  State<SimilarWidget> createState() => _SimilarWidgetState();
}

class _SimilarWidgetState extends State<SimilarWidget> {
  SimilarViewModel viewModel = SimilarViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSimilarMovies(widget.movieID);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<SimilarViewModel, SimilarStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SimilarLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.gray,
              ),
            );
          } else if (state is SimilarErrorState) {
            return Center(
              child: Text(
                'No Similar Movies Found For This Movie',
                style: AppStyles.bold20white,
              ),
            );
          } else if (state is SimilarSuccessState) {
            return SizedBox(
              height: height * 0.3,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MoviePosterRateWidget(
                        imagePath: state.moviesSuggestionsList[index]
                                .mediumCoverImage ??
                            AppAssets.errorImage,
                        rate: state.moviesSuggestionsList[index].rating ?? 0);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: state.moviesSuggestionsList.length),
            );
            //   SizedBox(
            //   height: height*0.7,
            //   child: GridView.builder(
            //       scrollDirection: Axis.values[0],
            //       itemCount: state.moviesSuggestionsList.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           // childAspectRatio: 0.75/2,
            //           // mainAxisSpacing: 15,
            //           crossAxisSpacing: 20
            //       ),
            //       itemBuilder: (context,index){
            //         return MoviePosterRateWidget(
            //             imagePath: state.moviesSuggestionsList[index].mediumCoverImage??'',
            //             rate: state.moviesSuggestionsList[index].rating??0);
            //       }
            //   ),
            // );
          }
          return Container();
        });
  }
}
