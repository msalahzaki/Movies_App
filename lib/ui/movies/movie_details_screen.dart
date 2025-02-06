import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_details_model.dart';
import 'package:movies_app/ui/movies/cubit/movie_details_state.dart';
import 'package:movies_app/ui/movies/cubit/movie_details_viewModel.dart';
import 'package:movies_app/ui/movies/widgets/movie_likes_duration_rate_widget.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
final String movieId ;

  @override
  Widget build(BuildContext context) {
    MovieDetailsViewmodel viewmodel = MovieDetailsViewmodel();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Movie movie ;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: BlocConsumer<MovieDetailsViewmodel,MovieDetailsState>(
          bloc: viewmodel..getMovieDetails(movieId),
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is LoadingMovieDetailsState){
              return const Center(child: CircularProgressIndicator(),);
            }if(state is FailLoadMovieDetailsState){
              return  Center(child: Text("Error",style: AppStyles.normal20primary,),);
            }
             movie =viewmodel.movieDetails!.data!.movie!;
            return Column(children: [
              Container(
                  height: height * .5,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          movie.mediumCoverImage ??""),
                      fit: BoxFit.cover,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColor.white,
                                  size: 35,
                                ),
                                onPressed: () {Navigator.pop(context);},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: AppColor.white,
                                  size: 35,
                                ),
                                onPressed: () {},
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
                            movie.title??"",
                            style: AppStyles.bold24white,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            movie.year.toString() ,
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
                  onPressed: () {},
                  child: Text(
                    "Watch",
                    style: AppStyles.bold24white,
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MovieLikesDurationRateWidget(iconPath: AppAssets.loveIcon,text: movie.likeCount.toString() ,),
                  MovieLikesDurationRateWidget(iconPath: AppAssets.timeIcon,text: movie.runtime.toString()),
                  MovieLikesDurationRateWidget(iconPath: AppAssets.starIcon,text: movie.rating.toString() ,),
                ],
              )
              /// Mohamed Salah Code End


            ]);
          },

        ),
      ),
    ));
  }
}
