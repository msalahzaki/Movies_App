import 'dart:convert';
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/movie_details_model.dart';


class ApiMangerMovieDetails {

  static Future<MovieDetailsModel?> getMovieDetails(String movieID) async {
    try {
      Uri url = Uri.https(ApiConst.baseMoviesURL, EndPoints.movieDetails,
          {'movie_id': movieID, 'with_images': 'true', 'with_cast': 'true'});

      print(url);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print("------****************-$e***********----");
      return null ;
    }
  }

 static Future<String?> addFavorite(String movieId, String name, double rating,
      String imageURL, String year, String token) async {
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
      var response = await http.get(
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
