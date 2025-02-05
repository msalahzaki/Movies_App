import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/movies/cubit/movies_states.dart';
import 'package:movies_app/ui/movies/cubit/movies_view_model.dart';
import 'package:movies_app/utils/app_color.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_styles.dart';
import 'movie_poster_rate_widget.dart';

class MoviesWidget extends StatefulWidget {
  const MoviesWidget({super.key});

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  var carouselController = CarouselController();
  int currentIndex = 0;

  MoviesViewModel viewModel = MoviesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => viewModel,
      child:
          BlocBuilder<MoviesViewModel, MoviesStates>(builder: (context, state) {
        if (state is MoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.gray,
            ),
          );
        } else if (state is MoviesErrorState) {
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
        } else if (state is MoviesSuccessState) {
          return Column(
            children: [
              Container(
                height: height * .6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        state.moviesList[currentIndex].largeCoverImage ??
                            AppAssets.errorImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(18, 19, 18, 0.08),
                        Color.fromRGBO(18, 19, 18, 0.06),
                        Color.fromRGBO(18, 19, 18, 1),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(AppAssets.availableNow),
                        CarouselSlider.builder(
                            itemCount: state.moviesList.length,
                            itemBuilder: (context, index, realIndex) {
                              return MoviePosterRateWidget(
                                  imagePath:
                                      state.moviesList[index].largeCoverImage ??
                                          AppAssets.errorImage,
                                  rate: state.moviesList[index].rating ?? 0);
                            },
                            options: CarouselOptions(
                                height: height * 0.35,
                                viewportFraction: 0.5,
                                enableInfiniteScroll: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                onPageChanged: (index, reason) {
                                  currentIndex = index;
                                  setState(() {});
                                })),
                        Image.asset(AppAssets.watchNow),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      }),
    );
  }
}
