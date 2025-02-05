import 'package:movies_app/model/user_profile.dart';

abstract class UpdateProfileStates {}


class GetProfileLoadingState extends UpdateProfileStates{}
class GetProfileErrorState extends UpdateProfileStates{
  String errorMessage ;
  GetProfileErrorState(this.errorMessage);
}
class GetProfileSussesState extends UpdateProfileStates{
  UserProfile userProfile ;

  GetProfileSussesState(this.userProfile);
}

class UpdateProfileSussesState extends UpdateProfileStates{}
class UpdateProfileErrorState extends UpdateProfileStates{
  String errorMassage;

  UpdateProfileErrorState(this.errorMassage);
}
class UpdateProfileLoadingState extends UpdateProfileStates{}

class DeleteProfileConfirmState extends UpdateProfileStates{}
class DeleteProfileSuccessState extends UpdateProfileStates{}
class DeleteProfileErrorState extends UpdateProfileStates{
  String errorMassage;

  DeleteProfileErrorState(this.errorMassage);
}




class UpdateProfileChangeAvatarState extends UpdateProfileStates{}


