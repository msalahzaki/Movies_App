abstract class LanguageStates {}
class ChangeLanguageState extends LanguageStates{
  String language ;
  ChangeLanguageState(this.language);
}
class ChangeLanguageInitialState extends LanguageStates{}