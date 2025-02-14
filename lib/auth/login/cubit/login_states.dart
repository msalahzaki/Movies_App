abstract class LoginStates {}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  String message;
  FailureLoginState({required this.message});
}

class SucessLoginState extends LoginStates {
  String message;
  Function? go;
  SucessLoginState({required this.message, this.go});
}
