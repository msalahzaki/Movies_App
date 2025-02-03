import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_const.dart';
import 'package:movies_app/api/end_points.dart';

class ApiManger {

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
