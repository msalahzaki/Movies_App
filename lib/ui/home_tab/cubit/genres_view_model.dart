import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';

import 'package:movies_app/model/genres_model.dart';
import 'package:movies_app/ui/home_tab/cubit/genres_states.dart';

class GenresViewModel extends Cubit<GenresStates> {
  late String genre;
late int randomIndex ;
  GenresViewModel() :super(GenresLoadingState());

  //todo: hold data / handle logic

  void getMoviesByGenre() async {
    randomIndex = Random().nextInt(24);
    genre = GenresModel.genresList[randomIndex];
    try {
      emit(GenresLoadingState());
      var response = await ApiManger.getMoviesByGenre(genre);
      if (response.status == 'error') {
        emit(GenresErrorState(errorMessage: response.statusMessage!));
        return;
      }
      if (response.status == 'ok') {
        emit(GenresSuccessState(
            moviesList: response.data!.movies!, genre: genre));
        return;
      }
    } catch (e) {
      emit(GenresErrorState(errorMessage: e.toString()));
    }
  }
}