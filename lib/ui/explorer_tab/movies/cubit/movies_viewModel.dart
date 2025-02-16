
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/MoviesResponse.dart';

import 'movies_states.dart';

class MoviesViewmodel extends Cubit<MoviesStates> {
  MoviesViewmodel() : super(IntialMovies()){
    pageNum =1 ;
  }
  late int pageNum;
  List<Movies> moviesList =[];


  void getMovies(String genre) async {
    try {
      if(moviesList.isEmpty) {
        emit(LoadingMovies());
      }
      MoviesResponse response = await ApiManger.getMoviesByGenre(genre,pageNum: pageNum);
      if (response.status == 'ok') {
        if (response.data!.movies != null){
          moviesList.addAll(response.data!.movies!);
          pageNum ++ ;
          emit(SucessMovies(moviesResponse: response));
        }

      } else {
        emit(FailureMovies(errMessage: response.statusMessage!));
      }
    } catch (e) {
      emit(FailureMovies(errMessage: 'an error has occured'));
    }
  }
}
