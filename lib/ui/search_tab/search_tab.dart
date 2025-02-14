import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/movies/movie_details_screen.dart';
import 'package:movies_app/ui/movies/movie_poster_rate_widget.dart';
import 'package:movies_app/ui/search_tab/search_response.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

import 'cubit/search_cubit.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMovieCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColor.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16.0, right: 16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  style: AppStyles.normal16white,
                  decoration: InputDecoration(
                    prefixIcon:  ImageIcon(color: AppColor.white,AssetImage('assets/icons/searchIcon.png')),
                    filled: true,
                    fillColor: AppColor.semiBlack,
                    enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                    hintText: "Search",
                    hintStyle: AppStyles.normal16white,
                    focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                  ),
                  onChanged: (query) {
                    context.read<SearchMovieCubit>().searchMovies(query);
                  },
                ),
                Expanded(
                  child: BlocBuilder<SearchMovieCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        return Center(
                          child: Image.asset(
                            'assets/images/emptyBG.png',
                            width: 200,
                          ),
                        );
                      } else if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoaded) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            final movie = state.movies[index];
                            return //MoviePosterRateWidget(imagePath: movie['medium_cover_image'], rate: movie['rating'] ?? 'N/A');
                              InkWell(
                                onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: movie['id'].toString()),)),
                                child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      movie['medium_cover_image'],
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      width: 70,
                                      height: 32,
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(13)),
                                        color: Color(0xd3121312),
                                      ),
                                      child: Text(
                                          '${movie['rating'] ?? 'N/A'} ⭐',
                                          style: AppStyles.normal16white
                                      ),
                                    ),
                                  ),
                                ],
                                                            ),
                              );
                          },
                        );
                      } else if (state is SearchError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

