import 'package:movies_app/model/MoviesResponse.dart';

abstract class MoviesStates {}

class IntialMovies extends MoviesStates {}

class LoadingMovies extends MoviesStates {}

class FailureMovies extends MoviesStates {
  String errMessage;
  FailureMovies({required this.errMessage});
}

class SucessMovies extends MoviesStates {
  MoviesResponse moviesResponse;
  SucessMovies({required this.moviesResponse});
}
