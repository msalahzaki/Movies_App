import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/register_screen_view/register_screen_view.dart';
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
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.dark,
      home: RegisterScreenView(),
    );
  }
}
