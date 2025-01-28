import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/language_states.dart';

class LanguageCubit extends Cubit<LanguageStates>{
  String language = "en";
  LanguageCubit():super(ChangeLanguageInitialState());

  void changeLanguage({required String language}){
    this.language = language;
          emit(ChangeLanguageState(language));
     }


}