import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home_tab/cubit/genres_states.dart';
import 'package:movies_app/ui/home_tab/cubit/genres_view_model.dart';
import 'package:movies_app/ui/movies/movie_details_screen.dart';

import 'package:movies_app/utils/app_assets.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../movies/movie_poster_rate_widget.dart';

class GenresWidget extends StatefulWidget {
  const GenresWidget({super.key});

  @override
  State<GenresWidget> createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  GenresViewModel viewModel = GenresViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoviesByGenre();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => viewModel,
      child:
          BlocBuilder<GenresViewModel, GenresStates>(builder: (context, state) {
        if (state is GenresLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.gray,
            ),
          );
        } else if (state is GenresErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.errorMessage,
                  style: AppStyles.bold20white,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Try Again',
                      style: AppStyles.bold20white,
                    ))
              ],
            ),
          );
        } else if (state is GenresSuccessState) {
          return SizedBox(
            height: height * 0.4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.genre,
                      style: AppStyles.normal20white,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See More ->",
                          style: AppStyles.normal16primary,
                        )),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.04,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: state.moviesList[index].id!.toString()),));
                      },
                        child: MoviePosterRateWidget(
                            imagePath: state.moviesList[index].largeCoverImage ??
                                AppAssets.errorImage,
                            rate: state.moviesList[index].rating ?? 0),
                      );
                    },
                    itemCount: state.moviesList.length,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
