import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/MoviesResponse.dart';

class ApiManager {
  static const String url = "https://yts.mx/api/v2/list_movies.json";

  static Future<MoviesResponse> getMovies() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception;
    }
  }

  static Future<MoviesResponse> getMoviesByGenre(String genre) async {
    final response = await http
        .get(Uri.parse(url).replace(queryParameters: {'genre': genre}));
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception;
    }
  }
}