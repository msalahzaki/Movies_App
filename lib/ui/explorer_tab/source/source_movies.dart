import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/explorer_tab/explorer_tab.dart';
import 'package:movies_app/ui/explorer_tab/movies/movies_widget.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_states.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_viewModel.dart';

class SourceMovies extends StatefulWidget {
  SourceMovies({this.selectedIndex=0 ,super.key});
      int selectedIndex ;
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
    sourceMoviesViewmodel = SourceMoviesViewmodel(selectedIndex:widget.selectedIndex );
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

            _tabController = TabController(
                length: sourceMoviesViewmodel.genres.length, vsync: this);
            _tabController.animateTo(widget.selectedIndex);
            return Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                TabBar(
                    controller: _tabController,
                    onTap: (index) {
                      sourceMoviesViewmodel.changIndex(index);
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
                                  sourceMoviesViewmodel.selectedIndex!],
                              width: width,
                              height: height,
                            )
                          : UnSelectedTab(
                              text: genre,
                              width: width,
                              height: height,
                            );
                    }).toList()),
                SizedBox(
                  height: height * 0.02,
                ),
                MoviesWidget(
                  selectedGeners: sourceMoviesViewmodel
                      .genres[sourceMoviesViewmodel.selectedIndex!],
                  height: height,
                  width: width,
                ),
              ],
            );

            /*  */
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
