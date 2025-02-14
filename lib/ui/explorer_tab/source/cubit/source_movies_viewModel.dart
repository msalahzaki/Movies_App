import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/model/genres_model.dart';
import 'package:movies_app/ui/explorer_tab/source/cubit/source_movies_states.dart';

class SourceMoviesViewmodel extends Cubit<SourceMoviesStates> {
  SourceMoviesViewmodel() : super(IntialSourceMovies());
  int selectedIndex = 0;
  List<String> genres = GenresModel.genresList;
  List<Movies> moviesList = []; // Store all movies
  List<Movies> filteredMovies = []; // Store filtered movies

  /// **Filter movies based on selected genre**
  void filterMoviesByGenre() {
    if (moviesList.isEmpty) return; // Ensure movies are loaded
    String selectedGenre = genres[selectedIndex];

    filteredMovies = moviesList
        .where((movie) => movie.genres?.contains(selectedGenre) ?? false)
        .toList();
  }

  void changIndex(int index) {
    if (index == selectedIndex) return; // Prevent reloading if same index
    selectedIndex = index;

    filterMoviesByGenre(); // Filter movies based on selected genre

    emit(ChangeIndexSourceMovies());
    emit(SucessSourceMovies(
        moviesResponse: MoviesResponse(data: Data(movies: filteredMovies))));
  }

  void getSources() async {
    try {
      emit(LoadingSourceMovies());
      var sourceresponse = await ApiManger.getMovies();
      if (sourceresponse.status == 'ok') {
        filterMoviesByGenre(); // Apply initial filtering

        emit(SucessSourceMovies(moviesResponse: sourceresponse));
      } else {
        emit(FailureSourceMovies(errMessage: sourceresponse.statusMessage!));
      }
    } catch (e) {
      emit(FailureSourceMovies(errMessage: 'an error has occured'));
    }
  }
}
