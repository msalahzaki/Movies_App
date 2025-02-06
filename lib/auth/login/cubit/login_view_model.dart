import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends Cubit<LoginStates> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String? savedToken;
  late String? savedPass;
  LoginViewModel() : super(LoadingLoginState());

  Future<void> login() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (formkey.currentState!.validate()) {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
//online
        try {
          emit(LoadingLoginState());
          var response = await ApiManger.loginApi(
              emailController.text, passwordController.text);
          if (response != null && response.message == 'Success Login') {
            await _saveToken(response.token); // Save token locally
            await _savePassword(passwordController.text); // Save password

            // Immediately fetch and print the saved password for debugging
            savedPass = await getSavedPassword();
            print("✅ Saved Password: $savedPass");

            savedToken = await getSavedToken();
            print("✅ Saved token: $savedToken");

            emit(SucessLoginState(message: response.message));
          } else {
            emit(FailureLoginState(
                message: response?.message ?? "Login failed"));
          }
        } catch (e) {
          emit(FailureLoginState(message: "an error has occured"));
        }
      }
    }
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
