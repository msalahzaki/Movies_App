import 'package:movies_app/model/MoviesResponse.dart';

abstract class SourceMoviesStates {}

class IntialSourceMovies extends SourceMoviesStates {}

class LoadingSourceMovies extends SourceMoviesStates {}

class FailureSourceMovies extends SourceMoviesStates {
  String errMessage;
  FailureSourceMovies({required this.errMessage});
}

class SucessSourceMovies extends SourceMoviesStates {
  MoviesResponse moviesResponse;
  SucessSourceMovies({required this.moviesResponse});
}

class ChangeIndexSourceMovies extends SourceMoviesStates {}
