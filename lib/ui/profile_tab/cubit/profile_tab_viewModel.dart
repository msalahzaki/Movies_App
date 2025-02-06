import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_states.dart';

import '../../../api/api_manger.dart';
import '../../../auth/login/cubit/login_view_model.dart';
import '../../../model/user_profile.dart';

class ProfileTabViewmodel extends Cubit<ProfileTabStates>{
  ProfileTabViewmodel():super(GetProfileLoadingState());

  UserProfile? currentUser;
  LoginViewModel? loginViewModel ;
  String stoken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTAwM2U1MmRiNDBjYTQwNTYwYWNmZCIsImVtYWlsIjoieW91c3NlZjIyQGdtYWlsLmNvbSIsImlhdCI6MTczODY1NDc5NX0.Y4PBCVjPm4uEA9-q0TNsbOfzFzj_tnVFXX4WXYZUzMI";

  Future<UserProfile?> getProfile({required String? token}) async {
    token ??= stoken ;

    emit(GetProfileLoadingState());
    UserProfile? response = await ApiManger.getProfileData(token);
    if (response == null) {
      emit(GetProfileErrorState("Erorr get Profile Information"));
    }
    else if (response.data == null) {
      print(response.message!);
      emit(GetProfileErrorState(response.message!));
    }
    else {
      currentUser = response;
      emit(GetProfileSussesState(response));
    }
    return null;
  }



}