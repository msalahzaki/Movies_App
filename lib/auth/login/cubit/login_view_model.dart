import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends Cubit<LoginStates> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "youssef22@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "You2512@");
  late String? userToken;
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
          UserModel? response = await ApiManger.loginApi(
              emailController.text, passwordController.text);
          if (response != null && response.message!.contains( 'Success Login')) {
            userToken = response.token ;
            await _saveToken(response.token! ); // Save token locally
            await _savePassword(passwordController.text); // Save password
            emit(SucessLoginState(message: response.message.toString()));
          } else {
            emit(FailureLoginState(
                message: response?.message.toString() ?? "Login failed"));
          }
        } catch (e) {
          emit(FailureLoginState(message: "an error has occured"));
        }
      }else {
        emit(FailureLoginState(message: "No Internet Connection"));
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

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    userToken = credential.token.toString();
    await _saveToken(credential.token.toString());
    final UserCredential uCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (uCredential.user != null) {
      goToHome(context);
      print(uCredential.user!.email);
    }
  }
}
