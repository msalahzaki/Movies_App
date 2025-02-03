import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/user_profile.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_states.dart';

class UpdateProfileViewmodel extends Cubit<UpdateProfileStates> {
  UpdateProfileViewmodel() : super(GetProfileLoadingState());

  final formKey = GlobalKey<FormState>();
  late int profileAvatar;
  String stoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTBmMmQzNGRiMzc5Yjg1MzMwN2Q5YiIsImVtYWlsIjoibWVsYXJhYnkxQGdtYWlsLmNvbSIsImlhdCI6MTczODYwMTQ1NX0.IA_YTFy4uoDYP6OWhy4AGAJ8xDQHxYphxAJXCFnxh4E";

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  Future<UserProfile?> getProfile({String? token}) async {
    token = stoken ;

    emit(GetProfileLoadingState());
    UserProfile? response = await ApiManger.getProfileData(token);
    if (response == null) {
      emit(GetProfileErrorState("Erorr get Profile Information"));
    }
    if (response!.data == null) {
      emit(GetProfileErrorState(response.message!));
    }
    else {
      nameEditingController.text = response.data!.name ?? "";
      phoneEditingController.text = response.data!.phone ?? "";
      profileAvatar = response.data!.avaterId ?? 1;
      emit(GetProfileSussesState(response));
    }
    return null;
  }

  Future<void> updateProfile({String? token}) async {
    token = stoken ;
    if(formKey.currentState!.validate())
    {
      emit(UpdateProfileLoadingState());

      String? response = await ApiManger.updateProfile(
          token: token,
          name: nameEditingController.text,
          phone: phoneEditingController.text,
          avatarID: profileAvatar);
      if (response == null) {
        emit(UpdateProfileSussesState());
        getProfile();
      } else {
        emit(UpdateProfileErrorState(response));
      }
    }
  }

  Future<void> deleteProfile({String? token}) async {
    token = stoken ;
    emit(UpdateProfileLoadingState());

    String? response = await ApiManger.deleteProfile(token: token);
    if (response == null) {
      emit(DeleteProfileSuccessState());

    } else {
      emit(DeleteProfileErrorState(response));
    }
  }

  changeAvatar(int avatarID) {
    profileAvatar = avatarID;
    emit(UpdateProfileChangeAvatarState());
  }

  validatePhoneNumber(String? phoneNumber){


        if (phoneNumber == null || phoneNumber.isEmpty) {
          return 'Please enter a phone number';
        }

        // Check if it starts with "+2"
        if (!phoneNumber.startsWith('+2')) {
          return 'Phone number must start with +2';
        }

        if (phoneNumber.substring(2) .length != 11 ) {
          return 'The Phone must be 11 numbers';
        }

        return null;
      }

}
