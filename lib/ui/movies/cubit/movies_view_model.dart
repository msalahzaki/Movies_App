import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';

import 'package:movies_app/ui/movies/cubit/movies_states.dart';

class MoviesViewModel extends Cubit<MoviesStates> {
  MoviesViewModel() : super(MoviesLoadingState());

  //todo: hold data / handle logic

  void getMovies() async {
    try {
      emit(MoviesLoadingState());
      var response = await ApiManger.getMovies();
      if (response.status == 'error') {
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
        return;
      }
      if (response.status == 'ok') {
        emit(MoviesSuccessState(moviesList: response.data!.movies!));
        return;
      }
    } catch (e) {
      emit(MoviesErrorState(errorMessage: e.toString()));
    }
  }
}
