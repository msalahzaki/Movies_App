import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/login/login_screen.dart';

import 'home.dart';
import 'utils/BlocObserver.dart';
import 'utils/app_theme.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.dark,
      initialRoute: LoginScreen.loginScreenId,
      routes: {
        Home.homeScreenId: (context) => Home(),
        LoginScreen.loginScreenId: (context) => LoginScreen()
      },
    );
  }
}
