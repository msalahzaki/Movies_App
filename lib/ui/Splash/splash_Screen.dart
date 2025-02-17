import 'package:flutter/material.dart';

import '../../auth/forget_Password/forget_Password.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgetPassword(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
          fit: BoxFit.fill,
          width: double.infinity,
          "assets/images/SplashScreen.png"),
    );
  }
}
