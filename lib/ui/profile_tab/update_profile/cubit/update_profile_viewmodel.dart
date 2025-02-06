import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/user_profile.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_viewModel.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_states.dart';

class UpdateProfileViewmodel extends Cubit<UpdateProfileStates> {
  UpdateProfileViewmodel() : super(GetProfileLoadingState());
late ProfileTabViewmodel profileTabViewmodel ;

  final formKey = GlobalKey<FormState>();
  late int profileAvatar = -1;
  String stoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTAwM2U1MmRiNDBjYTQwNTYwYWNmZCIsImVtYWlsIjoieW91c3NlZjIyQGdtYWlsLmNvbSIsImlhdCI6MTczODU0MDAzNn0._1yES6bMpbrosBAIUuQVrCN2ZLkg4_Yehe6k0Koq4co";
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  Future<void> updateProfile({String? token}) async {
    token ??= profileTabViewmodel.loginViewModel!.userToken ??= "";
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
        profileTabViewmodel.getProfile(token: profileTabViewmodel.loginViewModel?.userToken);
      } else {
        emit(UpdateProfileErrorState(response));
      }
    }
  }

  Future<void> deleteProfile({String? token}) async {
    token ??= profileTabViewmodel.loginViewModel!.userToken ??= "";
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

  initProfileData(){
    if(profileAvatar == -1)
    {
      profileAvatar = profileTabViewmodel.currentUser!.data!.avaterId ?? 1;
      nameEditingController.text =
          profileTabViewmodel.currentUser!.data!.name ?? "";
      phoneEditingController.text =
          profileTabViewmodel.currentUser!.data!.phone ?? "";
    }
  }
}
