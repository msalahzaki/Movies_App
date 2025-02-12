import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/MovieSuggestions.dart';
import 'package:movies_app/model/movie_details_model.dart';


class ApiMangerMovieDetails {

  static Future<MovieDetailsModel?> getMovieDetails(String movieID) async {
    try {
      Uri url = Uri.https(ApiConst.baseMoviesURL, EndPoints.movieDetails,
          {'movie_id': movieID, 'with_images': 'true', 'with_cast': 'true'});
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<MovieSuggestions?> getSuggestionMovies(String movieID) async {
    try {
      Uri url = Uri.https(ApiConst.baseMoviesURL, EndPoints.movieSuggestions,
          {'movie_id': movieID});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieSuggestions.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

 static Future<String?> addFavorite(
      {required String movieId,
      required String name,
      required double rating,
      required String imageURL,
      required String year,
      required String token}) async {
    final url = Uri.https(
      ApiConst.baseAuthURL,
      EndPoints.favoriteAdd,
    );
     try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "movieId": movieId,
          "name": name,
          "rating": rating,
          "imageURL": imageURL,
          "year": year,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data["message"];
      } else {
        ///Error
        return data["message"];
      }
    } catch (e) {
      return "Failed to add favorite";
    }
  }

 static Future<bool?> isFavorite(String movieId, String token) async {
    Uri url =
        Uri.https(ApiConst.baseAuthURL, "/favorites/is-favorite/$movieId");
    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Attach token here
        },
      );
      var json = jsonDecode(response.body);
      if (json["data"] == true) {
        return true;
      } else if (json["data"] == false) {
        return false;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

 static Future<String?> removeFavorite(String movieId, String token) async {
    Uri url = Uri.https(ApiConst.baseAuthURL, "/favorites/remove/$movieId");
    try {
      var response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Attach token here
        },
      );
      var json = jsonDecode(response.body);
      return json["message"];
    } catch (e) {
      return null;
    }
  }
}
