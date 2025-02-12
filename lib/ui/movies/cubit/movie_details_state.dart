class MovieDetailsState {}
class LoadingMovieDetailsState extends MovieDetailsState{}
class FailLoadMovieDetailsState extends MovieDetailsState{}
class SuccessLoadMovieDetailsState extends MovieDetailsState{}

class AddedRemoveFavoriteMovieDetailsState extends MovieDetailsState{
  String message;
  AddedRemoveFavoriteMovieDetailsState(this.message);
}