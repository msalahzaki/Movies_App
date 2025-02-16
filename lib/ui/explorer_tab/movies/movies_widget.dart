import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/ui/explorer_tab/movies/MovieItem.dart';
import 'package:movies_app/ui/explorer_tab/movies/cubit/movies_viewModel.dart';
import 'package:movies_app/ui/movies/movie_details_screen.dart';

import 'package:movies_app/utils/app_styles.dart';
import 'cubit/movies_states.dart';

class MoviesWidget extends StatefulWidget {
  String selectedGeners;
  MoviesWidget(
      {super.key,
      required this.selectedGeners,
      required double height,
      required double width});

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  MoviesViewmodel moviesViewModel = MoviesViewmodel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesViewModel.getMovies(widget.selectedGeners);
  }

  @override
  void didUpdateWidget(covariant MoviesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedGeners != oldWidget.selectedGeners) {
      moviesViewModel.pageNum =1 ;
      moviesViewModel.moviesList = [];
      moviesViewModel.getMovies(widget.selectedGeners);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => moviesViewModel,
      child: BlocBuilder<MoviesViewmodel, MoviesStates>(
        builder: (context, state) {
          if (state is FailureMovies) {
            return Text(
              state.errMessage,
              style: AppStyles.normal16gray,
            );
          } else if (state is SucessMovies) {
            if (state.moviesResponse.data!.movies!.isEmpty) {
              return Center(
                child: Text(
                  "No movies available",
                  style: AppStyles.bold14primary,
                ),
              );
            } else {
              print('sucesss');

              return Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification:(notification) {
                      if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
                        moviesViewModel.getMovies(widget.selectedGeners);                      }
                      return true;
                  },
                  child: GridView.builder(

                    itemCount: moviesViewModel.moviesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: height * 0.01),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MovieDetailsScreen(movieId:moviesViewModel.moviesList[index].id.toString() ,),)),
                        child: MovieItem(
                            moviesobj: moviesViewModel.moviesList[index],
                            width: width,
                            height: height),
                      );
                    },
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
        },
      ),
    );
  }
}
