import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends Cubit<LoginStates> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginViewModel() : super(LoadingLoginState());

  Future<UserModel?> login() async {
    if (formkey.currentState!.validate()) {
      try {
        emit(LoadingLoginState());
        var response = await ApiManger.loginApi(
            emailController.text, passwordController.text);
        if (response != null && response.message == 'Success Login') {
          await _saveToken(response.token); // Save token locally
          await _savePassword(passwordController.text); // Save password

          // Immediately fetch and print the saved password for debugging
          String? savedPass = await getSavedPassword();
          print("✅ Saved Password: $savedPass");

          String? savedToken = await getSavedToken();
          print("✅ Saved token: $savedToken");

          emit(SucessLoginState(message: response.message));
          print("passsss:${response.password}");

          print(response.token);
          return response; // Return the user model
        } else {
          emit(FailureLoginState(message: response?.message ?? "Login failed"));
        }
      } catch (e) {
        emit(FailureLoginState(message: "an error has occured"));
      }
    }

    return null;
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  Future<String?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('user_token');
    print("🔴 getSavedToken: Retrieved token = $token");
    return token;
  }

  Future<void> _savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_password', password);
    print("🔵 _savePassword: Password Saved Successfully");
  }

  Future<String?> getSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();
    String? password = prefs.getString('user_password');
    print("🔴 getSavedPassword: Retrieved Password = $password");
    return password;
  }

  void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, Home.homeScreenId);
  }
}
