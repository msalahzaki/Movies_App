import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger_movieDetails.dart';
import 'package:movies_app/ui/movies/cubit/similar_states.dart';

class SimilarViewModel extends Cubit<SimilarStates> {
  SimilarViewModel() : super(SimilarLoadingState());

  //todo: hold data / handle logic

  void getSimilarMovies(String movieID) async {
    try {
      emit(SimilarLoadingState());
      var response = await ApiMangerMovieDetails.getSuggestionMovies(movieID);
      if (response!.status == 'error') {
        emit(SimilarErrorState(errorMessage: response.statusMessage!));
      }
      if (response.status == 'ok') {
        emit(
            SimilarSuccessState(moviesSuggestionsList: response.data!.movies!));
      }
    } catch (e) {
      emit(SimilarErrorState(errorMessage: e.toString()));
    }
  }
}
