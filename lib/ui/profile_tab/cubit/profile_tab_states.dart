import 'package:movies_app/model/user_profile.dart';

abstract class ProfileTabStates {}


class GetProfileLoadingState extends ProfileTabStates{}
class GetProfileErrorState extends ProfileTabStates{
  String errorMessage ;
  GetProfileErrorState(this.errorMessage);
}
class GetProfileSussesState extends ProfileTabStates{
  UserProfile userProfile ;
  GetProfileSussesState(this.userProfile);
}
class ChangeIndexState extends ProfileTabStates{}


