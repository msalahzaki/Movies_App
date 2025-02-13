import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/ui/explorer_tab/explorer_tab.dart';
import 'package:movies_app/ui/explorer_tab/movies/MovieItem.dart';
import 'package:movies_app/ui/explorer_tab/movies/cubit/movies_viewModel.dart';
import 'package:movies_app/ui/movies/cubit/movies_view_model.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'cubit/movies_states.dart';

class MoviesWidget extends StatefulWidget {
  final List<Movies> moviesList;
  String selectedGeners;
  MoviesWidget(
      {super.key,
      required this.selectedGeners,
      required this.moviesList,
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
            if (widget.moviesList.isEmpty) {
              return const Center(
                child: Text("No movies available"),
              );
            } else {
              print('sucesss');

              return Expanded(
                child: GridView.builder(
                  itemCount: widget.moviesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: height * 0.01),
                  itemBuilder: (context, index) {
                    return MovieItem(
                        moviesobj: widget.moviesList[index],
                        width: width,
                        height: height);
                  },
                ),
              );
            }
          } else {
            return Center(
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
