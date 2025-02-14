class EndPoints {

  ///Movies EndPoints

  static const String listMovies = "/api/v2/list_movies.json";
  static const String movieDetails = "/api/v2/movie_details.json";
  static const String movieSuggestions = "/api/v2/movie_suggestions.json";


  ///Authentication EndPoints

  static const String login = "/auth/login" ;
  static const String register = "/auth/register" ;
  static const String resetPassword = "/auth/reset-password" ;

  /// Favorites  EndPoints
  static const String favoriteAdd = "/favorites/add" ;
  static const String favoritesAll = "/favorites/all" ;
  static const String favoritesRemoveMovieId = "/favorites/remove/movieId" ;
  static const String isFavorite = "/favorites/is-favorite/movieId" ;

  /// Profile
  static const String profile = "/profile" ;

}