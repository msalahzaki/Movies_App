import '../../../model/MoviesResponse.dart';

abstract class MoviesStates {}

class MoviesLoadingState extends MoviesStates {}

class MoviesErrorState extends MoviesStates {
  String errorMessage;

  MoviesErrorState({required this.errorMessage});
}

class MoviesSuccessState extends MoviesStates {
  List<Movies> moviesList;

  MoviesSuccessState({required this.moviesList});
}
