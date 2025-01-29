import 'package:flutter/material.dart';

import '../../auth/forget_Password/forget_Password.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Image.asset(fit: BoxFit.fill,width: double.infinity,"assets/images/SplashScreen.png")),
    );
  }
}
