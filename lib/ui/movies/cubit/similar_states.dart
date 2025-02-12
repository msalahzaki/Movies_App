import 'package:movies_app/model/MovieSuggestions.dart';

abstract class SimilarStates {}

class SimilarLoadingState extends SimilarStates {}

class SimilarErrorState extends SimilarStates {
  String errorMessage;

  SimilarErrorState({required this.errorMessage});
}

class SimilarSuccessState extends SimilarStates {
  List<Movies> moviesSuggestionsList;

  SimilarSuccessState({required this.moviesSuggestionsList});
}
