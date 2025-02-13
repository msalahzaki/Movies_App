import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_states.dart';

class SourceMoviesViewmodel extends Cubit<SourceMoviesStates> {
  SourceMoviesViewmodel() : super(IntialSourceMovies());
  int selectedIndex = 0;
  List<Movies> moviesList = [];
  List<String> genres = [];
  List<Movies> filteredMovies = [];

  void filterMoviesByGenre() {
    if (genres.isNotEmpty) {
      String selectedGenre = genres[selectedIndex];
      filteredMovies = moviesList
          .where((movie) => movie.genres?.contains(selectedGenre) ?? false)
          .toList();
    }
  }

  void changIndex(int index) {
    if (index == selectedIndex) return; // Prevent reloading if same index
    selectedIndex = index;

    /// **Filter movies instead of re-fetching**
    filterMoviesByGenre();

    emit(ChangeIndexSourceMovies()); // Notify UI about index change
    emit(SucessSourceMovies(
        moviesResponse: MoviesResponse(data: Data(movies: filteredMovies))));
  }

  void getSources() async {
    try {
      emit(LoadingSourceMovies());
      var sourceresponse = await ApiManger.getMovies();
      if (sourceresponse.status == 'ok') {
        moviesList = sourceresponse.data?.movies ?? [];

        /// **Extract unique genres**

        Set<String> uniqueGenres = {};
        for (var movie in moviesList) {
          if (movie.genres != null) {
            uniqueGenres.addAll(movie.genres!);
          }
        }
        genres = uniqueGenres.toList();

        /// **Filter movies initially**
        filterMoviesByGenre();
        emit(SucessSourceMovies(moviesResponse: sourceresponse));
      } else {
        emit(FailureSourceMovies(errMessage: sourceresponse.statusMessage!));
      }
    } catch (e) {
      emit(FailureSourceMovies(errMessage: 'an error has occured'));
    }
  }
}
