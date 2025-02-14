import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/cubit/language_states.dart';
import 'package:movies_app/ui/Splash/splash_Screen.dart';

import 'package:movies_app/ui/onBoarding/onBoarding_screen.dart';
import 'package:movies_app/ui/onBoarding/start_screen.dart';
import 'package:movies_app/ui/profile_tab/update_profile/resetPassword/reset_Password.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_viewModel.dart';
import 'package:path_provider/path_provider.dart';
import 'cubit/language_cubit.dart';
import 'package:movies_app/home.dart';
import 'utils/BlocObserver.dart';
import 'utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
        BlocProvider<LoginViewModel>(create: (context) => LoginViewModel()),
        BlocProvider<ProfileTabViewmodel>(
            create: (context) => ProfileTabViewmodel()),
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
      builder: (context, state) {
        String locale;
        if (state is ChangeLanguageState) {
          locale = state.language;
        } else {
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
          initialRoute: LoginScreen.loginScreenId,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            StartScreen.routeName: (context) => const StartScreen(),
            OnboardingScreen.routeName: (context) => const OnboardingScreen(),
            Home.homeScreenId: (context) => const Home(),
            LoginScreen.loginScreenId: (context) => const LoginScreen(),
            ResetPassword.routeName: (context) => const ResetPassword()
          },
        );
      },
    );
  }
}
