import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';
import 'package:movies_app/model/user_model.dart';

class ApiManger {
  static Future<UserModel?> loginApi(String email, String password) async {
    Uri url = Uri.https(
      ApiConst.baseAuthURL,
      EndPoints.login,
    );
    var response = await http.post(
      url,
      body: {"email": email, "password": password},
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['message'] == 'Success Login') {
        return UserModel.fromJson(jsonData);
      } else {
        print("faileed");

        throw Exception(jsonData['message'] ?? "Login failed");
      }
    } else {
      print("errrrror");
    }
  }
}
