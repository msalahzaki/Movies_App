import 'package:movies_app/model/MoviesResponse.dart';

abstract class GenresStates {}

class GenresLoadingState extends GenresStates {}

class GenresErrorState extends GenresStates {
  String errorMessage;

  GenresErrorState({required this.errorMessage});
}

class GenresSuccessState extends GenresStates {
  List<Movies> moviesList;
  String genre;

  GenresSuccessState({required this.moviesList, required this.genre});
}
