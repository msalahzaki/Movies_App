import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

import '../auth/widget/language_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenId = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logo,
                width: double.infinity,
                height: height * .27,
              ),
              TextFormField(
                style: AppStyles.normal20white,
                decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Image.asset(AppAssets.emailIcon),
                )
              ),
              SizedBox(
                height: height * 0.02,
              ),
             TextFormField(
               style: AppStyles.normal20white,
                 obscureText: obsecure,
                 decoration: InputDecoration(
                 suffixIcon: IconButton(onPressed: (){
                   obsecure = !obsecure;
                   setState(() {

                   });
                 },icon: Icon(obsecure?Icons.visibility_off:Icons.visibility),),
                 prefixIcon: Image.asset(AppAssets.passwordIcon),
                 hintText: "Password",
               ),
                ),
              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.02),
                  child: Text(
                    "Forget Password ?",
                    style: AppStyles.normal14primary,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Custom_Elevated_Button_login(
                  style: AppStyles.normal20black,
                  text: "Login",
                  width: width,
                  height: height),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: 'Don’t Have Account ? ',
                    style: AppStyles.normal14white,
                  ),
                  TextSpan(
                    text: 'Create One',
                    style: AppStyles.normal14primary,
                  )
                ])),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 90,
                      endIndent: 10,
                      thickness: 1,
                      color: AppColor.orange,
                    ),
                  ),
                  Text(
                    "OR",
                    style: AppStyles.normal14primary,
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 90,
                      thickness: 1,
                      color: AppColor.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Custom_Elevated_Button_login(
                  isIcon: true,
                  icon: AppAssets.googleIcon,
                  style: AppStyles.normal16black,
                  text: "Login With Google",
                  width: width,
                  height: height),
              SizedBox(
                height: height * 0.03,
              ),
              const Center(child: LanguageWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Elevated_Button_login extends StatelessWidget {
  final bool isIcon;
  final String text;
  final String? icon;
  final TextStyle? style;
  const Custom_Elevated_Button_login({
    this.isIcon = false,
    this.style,
    required this.text,
    this.icon,
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColor.orange),
        onPressed: () {
          //  Navigator.pushReplacementNamed(context, Home.homeScreenId);
        },
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.001),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon ? Image.asset(icon!) : const SizedBox.shrink(),
              isIcon
                  ? SizedBox(
                      width: width * 0.02,
                    )
                  : const SizedBox.shrink(),
              Text(
                text,
                style: style,
              ),
            ],
          ),
        )));
  }
}


