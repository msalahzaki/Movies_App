import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/ui/explorer_tab/explorer_tab.dart';
import 'package:movies_app/ui/explorer_tab/movies/movies_widget.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_states.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_viewModel.dart';

class SourceMovies extends StatefulWidget {
  SourceMovies({super.key});

  @override
  State<SourceMovies> createState() => _SourceMoviesState();
}

class _SourceMoviesState extends State<SourceMovies>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late SourceMoviesViewmodel sourceMoviesViewmodel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourceMoviesViewmodel = SourceMoviesViewmodel();
    sourceMoviesViewmodel.getSources();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => sourceMoviesViewmodel,
      child: BlocBuilder<SourceMoviesViewmodel, SourceMoviesStates>(
        builder: (context, state) {
          if (state is FailureSourceMovies) {
            print(state.errMessage);

            return Text(state.errMessage);
          } else if (state is SucessSourceMovies) {
            print('sucesss');

            if (sourceMoviesViewmodel.moviesList.isEmpty) {
              return const Center(child: Text("No movies available."));
            } else {
              _tabController = TabController(
                  length: sourceMoviesViewmodel.genres.length, vsync: this);

              return Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    child: TabBar(
                        controller: _tabController,
                        onTap: (index) {
                          sourceMoviesViewmodel.changIndex(index);

                          // sourceMoviesViewmodel.changIndex(index);
                          print("index $sourceMoviesViewmodel.selectedIndex");
                          print(
                              "sindex ${sourceMoviesViewmodel.selectedIndex}");
                        },
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        tabs: sourceMoviesViewmodel.genres
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          String genre = entry.value;

                          return sourceMoviesViewmodel.selectedIndex == index
                              ? SelectedTab(
                                  text: sourceMoviesViewmodel.genres[
                                      sourceMoviesViewmodel.selectedIndex],
                                  width: width,
                                  height: height,
                                )
                              : UnSelectedTab(
                                  text: genre,
                                  width: width,
                                  height: height,
                                );
                        }).toList()),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  MoviesWidget(
                    selectedGeners: sourceMoviesViewmodel
                        .genres[sourceMoviesViewmodel.selectedIndex],
                    height: height,
                    width: width,
                    moviesList: sourceMoviesViewmodel.moviesList
                        .where((movie) =>
                            movie.genres?.contains(sourceMoviesViewmodel
                                .genres[sourceMoviesViewmodel.selectedIndex]) ??
                            false)
                        .toList(),
                  ),
                ],
              );
            }

            /*  */
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
