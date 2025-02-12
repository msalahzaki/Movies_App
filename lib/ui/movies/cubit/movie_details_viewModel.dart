
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/api/api_manger_movieDetails.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/model/movie_details_model.dart';

import 'package:movies_app/ui/movies/cubit/movie_details_state.dart';

class MovieDetailsViewmodel extends Cubit<MovieDetailsState>{
  MovieDetailsViewmodel():super(LoadingMovieDetailsState());
 late String movieID;
 late LoginViewModel loginViewModel;
  MovieDetailsModel? movieDetails;
bool isFavorite = false ;

  getMovieDetails(String movieID) async{
    this.movieID = movieID;
emit(LoadingMovieDetailsState());
    movieDetails = await ApiMangerMovieDetails.getMovieDetails(movieID);
    if(movieDetails == null){
      emit(FailLoadMovieDetailsState());
    }
    else{
      isFavorite= await ApiMangerMovieDetails.isFavorite(movieID,loginViewModel.userToken!) ?? false;
      emit(SuccessLoadMovieDetailsState());
    }
  }

addToFavorite(Movie movie)async{
    try{
  await ApiMangerMovieDetails.addFavorite(movieId: movie.id.toString(),
      name: movie.title??"",
      rating: movie.rating??0,
      imageURL: movie.mediumCoverImage ??"",
      year: movie.year.toString() ,
      token: loginViewModel.userToken!);
  isFavorite = true;
  emit(AddedRemoveFavoriteMovieDetailsState("Movie Added to Favorite"));
  emit(SuccessLoadMovieDetailsState());
}catch(e){
      print(e.toString());
    }
  }
removeFromFavorite(Movie movie) async{

  try{
   String? response = await ApiMangerMovieDetails.removeFavorite(movie.id.toString(),
        loginViewModel.userToken!);
   print(response);
   if(response ==null ) {
     return ;
   }
    isFavorite = false;
    emit(AddedRemoveFavoriteMovieDetailsState("Movie Removed From Favorite"));
    emit(SuccessLoadMovieDetailsState());
  }catch(e){
    print(e.toString());
  }
}

  void saveMovieInHistory(Movie? movie) async {
    try {
      Box watchMovies = await Hive.openBox('Movies_History');
      watchMovies.put(movie!.id, movie.toJson());
      print("*************************${watchMovies.length}-------------------");
      watchMovies.close();

    } catch (e) {
      print(e);
    }
  }


}