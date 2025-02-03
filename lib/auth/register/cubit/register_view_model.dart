import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/auth/register/cubit/register_states.dart';

class RegisterViewModel extends Cubit<RegisterState>{

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  CarouselSliderController controller = CarouselSliderController();
  bool obSecure = false;
  int selectedAvatar = 1;
  var formKey = GlobalKey<FormState>();

  RegisterViewModel():super(RegisterLoadingState());

  void register() async{
    if(formKey.currentState!.validate() == true){
      try{
        emit(RegisterLoadingState());
        var statusCode = await ApiManger.registerUser(name: name.text, email: email.text,
            password: password.text, confirmPassword: confirmPassword.text,
            phone: phone.text, avatarId: selectedAvatar);
        if(statusCode == 201){
          emit(RegisterSuccessState(successMessage: 'User created successfully'));
        } else if(statusCode == 400){
          emit(RegisterErrorState(errorMessage: 'User already exist'));
        } else {
          emit(RegisterErrorState(errorMessage: 'Failed, Error in registration'));
        }
      }catch(e){
        emit(RegisterErrorState(errorMessage: 'Exception: $e'));
      }
    }

  }
  String? validName(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please Enter Name';
    }
    return null;
  }

  String? validEmail(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please Enter Email';
    }
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if(!emailValid){
      return 'Please enter valid email';
    }
    return null;
  }

  String? validPassword(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please Enter Password';
    }else if(text.length < 8){
      return 'password must be longer than or equal to 8 characters';
    }
    final bool oneUpperCase = RegExp(r'(?=.*?[A-Z])').hasMatch(text);
    final bool oneLowerCase = RegExp(r'(?=.*?[a-z])').hasMatch(text);
    final bool oneDigit = RegExp(r'(?=.*?[0-9])').hasMatch(text);
    final bool oneSpecialCharacter = RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(text);
    if(!oneUpperCase){
      return 'should contain at least one upper case';
    }
    if(!oneLowerCase){
      return 'should contain at least one lower case';
    }
    if(!oneDigit){
      return 'should contain at least one digit';
    }
    if(!oneSpecialCharacter){
      return 'should contain at least one Special character';
    }
    return null;
  }

  String? validRePassword(String? text){
    if(text == null || text.trim().isEmpty){
      return 'Please Confirm Your Password';
    }
    if(text != password.text){
      return 'password not match';
    }
    return null;
  }

  String? validPhoneNumber(String? text){
    if (text == null || text.isEmpty) {
      return 'Please enter a phone number';
    }

    // Check if it starts with "+2"
    if (!text.startsWith('+2')) {
      return 'Phone number must start with +2';
    }

    if (text.substring(2) .length != 11 ) {
      return 'The Phone must be 11 numbers';
    }

    return null;
  }
  void changePasswordIcon(){
    obSecure = !obSecure;
    emit(RegisterRefreshState());
  }
}