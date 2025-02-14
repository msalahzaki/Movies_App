import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';

import 'movies_states.dart';

class MoviesViewmodel extends Cubit<MoviesStates> {
  MoviesViewmodel() : super(IntialMovies());

  void getMovies(String genre) async {
    try {
      emit(LoadingMovies());
      var response = await ApiManger.getMoviesByGenre(genre);
      if (response.status == 'ok') {
        emit(SucessMovies(moviesResponse: response));
      } else {
        emit(FailureMovies(errMessage: response.statusMessage!));
      }
    } catch (e) {
      emit(FailureMovies(errMessage: 'an error has occured'));
    }
  }
}
