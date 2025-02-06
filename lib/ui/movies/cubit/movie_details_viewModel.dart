
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger_movieDetails.dart';
import 'package:movies_app/model/movie_details_model.dart';

import 'package:movies_app/ui/movies/cubit/movie_details_state.dart';

class MovieDetailsViewmodel extends Cubit<MovieDetailsState>{
  MovieDetailsViewmodel():super(LoadingMovieDetailsState());

  MovieDetailsModel? movieDetails;

  getMovieDetails(String movieID) async{
emit(LoadingMovieDetailsState());
    movieDetails = await ApiMangerMovieDetails.getMovieDetails(movieID);
    if(movieDetails == null){
      emit(FailLoadMovieDetailsState());
    }
    else{
      emit(SuccessLoadMovieDetailsState());
    }
  }


}