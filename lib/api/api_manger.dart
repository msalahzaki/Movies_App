import 'dart:convert';
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/user_profile.dart';
import '../model/MoviesResponse.dart';



class ApiManger {

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

  static Future<UserProfile?> getProfileData(String token) async {
    Uri url = Uri.https(ApiConst.baseAuthURL, EndPoints.profile);
    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Attach token here
        },
      );
      var json = jsonDecode(response.body);
      return UserProfile.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> updateProfile({required String token,required String name,required String phone,required int avatarID}) async {
    Uri url = Uri.https(ApiConst.baseAuthURL, EndPoints.profile);

    Map<String, dynamic> requestBody = {
      "name": name,
      "phone": phone,
      "avaterId": avatarID
    };

    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return null;
      } else {
        return (data['message'].join("\n"));
      }
    } catch (e) {
      return ("Error: $e");
    }
  }

  static Future<String?> deleteProfile({required String token}) async {
    Uri url = Uri.https(ApiConst.baseAuthURL, EndPoints.profile);
    try {
      var response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token', // Attach token here
        },
      );
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return null;
      } else {
        return (data['message'].join("\n"));
      }
    } catch (e) {
      return ("Error: $e");
    }
  }
      static Future<int> registerUser({required String name, required String email, required String password,
    required String confirmPassword, required String phone, required int avatarId}) async {
    try {

      Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avatarId,
      };
      final response = await http.post(
        Uri.https(ApiConst.baseAuthURL,EndPoints.register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      return response.statusCode;
    } catch (e) {
      print("Exception: $e");
      return -1;
    }

  }


}

