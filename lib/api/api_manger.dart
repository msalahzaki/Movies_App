import 'dart:convert';
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/user_profile.dart';
class ApiManger {

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
  }
