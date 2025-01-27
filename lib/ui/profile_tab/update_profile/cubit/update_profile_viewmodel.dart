import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_states.dart';

import '../../../../utils/app_assets.dart';


class UpdateProfileViewmodel extends Cubit<UpdateProfileStates>{

  UpdateProfileViewmodel():super(GetProfileSussesState());

  String profileAvatar = AppAssets.avatar2;

    TextEditingController nameEditingController = TextEditingController(text: "John Safwat");
    TextEditingController phoneEditingController =TextEditingController(text: "010000156");


  changeAvatar(String newPath){
    profileAvatar = newPath;
    emit(UpdateProfileHideModalSheetState());
  }

  showModalSheetState(){
    emit(UpdateProfileShowModalSheetState());
  }




}