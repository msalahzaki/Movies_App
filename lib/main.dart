import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/language_states.dart';
import 'package:movies_app/ui/login/login_screen.dart';
import 'package:movies_app/ui/onBoarding/onBoarding_screen.dart';
import 'package:movies_app/ui/onBoarding/start_screen.dart';
import 'cubit/language_cubit.dart';
import 'package:movies_app/home.dart';
import 'utils/BlocObserver.dart';
import 'utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LanguageCubit, LanguageStates>(
      builder:(context, state) {
        String locale ;
     if(state is ChangeLanguageState){
       locale = state.language;
     }else{
       locale = "en";
     }
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.dark,
          locale: Locale(locale),
          initialRoute: StartScreen.routeName,
          routes: {
            StartScreen.routeName: (context) => StartScreen(),
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            Home.homeScreenId: (context) => const Home(),
            LoginScreen.loginScreenId: (context) => const LoginScreen(),
          },

        );
      },

    );
  }
}
