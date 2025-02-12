import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/model/movie_details_model.dart';
import 'package:movies_app/ui/movies/cubit/movie_details_state.dart';
import 'package:movies_app/ui/movies/cubit/movie_details_viewModel.dart';
import 'package:movies_app/ui/movies/widgets/cast_widget.dart';
import 'package:movies_app/ui/movies/widgets/movie_likes_duration_rate_widget.dart';
import 'package:movies_app/ui/movies/widgets/screen_shot_widget.dart';
import 'package:movies_app/ui/movies/widgets/similar_widget.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsViewmodel viewmodel = MovieDetailsViewmodel();
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getMovieDetails(widget.movieId);

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    viewmodel.loginViewModel = BlocProvider.of<LoginViewModel>(context);
    Movie movie;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<MovieDetailsViewmodel, MovieDetailsState>(
          bloc: viewmodel,
          builder: (context, state) {
            if (state is LoadingMovieDetailsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FailLoadMovieDetailsState) {
              return Center(
                child: Text(
                  "Error",
                  style: AppStyles.normal20primary,
                ),
              );
            }
            movie = viewmodel.movieDetails!.data!.movie!;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie.largeCoverImage ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColor.black.withOpacity(.3),
                              AppColor.black,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColor.white,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  IconButton(
                                    icon:  Icon(
                                      Icons.bookmark,
                                      color: viewmodel.isFavorite?AppColor.orange: AppColor.white,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                   viewmodel.isFavorite? viewmodel.removeFromFavorite(movie): viewmodel.addToFavorite(movie);
                                    //  print(viewmodel.movieDetails?.data?.movie?.url);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .12,
                              ),
                              Image.asset(
                                AppAssets.playIcon,
                                height: height * .08,
                              ),
                              SizedBox(
                                height: height * .12,
                              ),
                              Text(
                                movie.title ?? "",
                                style: AppStyles.bold24white,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                movie.year.toString(),
                                style: AppStyles.bold24black
                                    .copyWith(color: const Color(0xffADADAD)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.red,
                          minimumSize: Size(width, height * .03)),
                      onPressed: () {
                        goToWebView();
                        viewmodel.saveMovieInHistory(movie);
                      },
                      child: Text(
                        "Watch",
                        style: AppStyles.bold24white,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieLikesDurationRateWidget(
                        iconPath: AppAssets.loveIcon,
                        text: movie.likeCount.toString(),
                      ),
                      MovieLikesDurationRateWidget(
                          iconPath: AppAssets.timeIcon,
                          text: movie.runtime.toString()),
                      MovieLikesDurationRateWidget(
                        iconPath: AppAssets.starIcon,
                        text: movie.rating.toString(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Screen Shots',
                    style: AppStyles.bold24white,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  ScreenShotWidget(
                      imagePath: movie.largeScreenshotImage1 ?? ''),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  ScreenShotWidget(
                      imagePath: movie.largeScreenshotImage2 ?? ''),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  ScreenShotWidget(
                      imagePath: movie.largeScreenshotImage3 ?? ''),

                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Similar',
                    style: AppStyles.bold24white,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SimilarWidget(movieID: widget.movieId),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Summary',
                    style: AppStyles.bold24white,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    (movie.descriptionIntro == null || movie.descriptionIntro!.isEmpty  ) ? 'No Summary Found For This Movie' :movie.descriptionIntro! ,
                    style: AppStyles.light16White,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Cast',
                    style: AppStyles.bold24white,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * (movie.cast?.length ?? 0) * 0.11,
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CastWidget(
                              imagePath: movie.cast![index].urlSmallImage ?? '',
                              name: movie.cast![index].name ?? '',
                              character:
                                  movie.cast![index].characterName ?? '');
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height * 0.01,
                          );
                        },
                        itemCount: movie.cast?.length ?? 0),
                  ),
                  Text(
                    'Genres',
                    style: AppStyles.bold24white,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  SizedBox(
                    height: height * 0.05,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.08,
                                vertical: height * 0.01),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.semiBlack),
                            child: Text(
                              movie.genres?[index] ?? '',
                              style: AppStyles.light16White,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.04,
                          );
                        },
                        itemCount: movie.genres?.length ?? 0),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  )
                ]);
          }, listener: (BuildContext context, MovieDetailsState state) {
            if(state is AddedRemoveFavoriteMovieDetailsState){
              Fluttertoast.showToast(msg: state.message);
            }
        },
        ),
      ),
    ));
  }

  void goToWebView() {
    print(viewmodel.movieDetails?.data?.movie?.url);
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(viewmodel.movieDetails?.data?.movie?.url ?? 'https://example.com'));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            SafeArea(child: WebViewWidget(controller: controller))));
  }
}
