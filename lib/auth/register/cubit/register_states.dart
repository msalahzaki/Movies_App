abstract class RegisterState{}
class RegisterSuccessState extends RegisterState{
  String successMessage;
  RegisterSuccessState({required this.successMessage});
}
class RegisterErrorState extends RegisterState{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterLoadingState extends RegisterState{}
class RegisterRefreshState extends RegisterState{}
