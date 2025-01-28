import 'package:flutter/material.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenId = "LoginScreen";
  bool iconEGSelected;
  bool iconUSASelected;

  LoginScreen(
      {this.iconEGSelected = false, this.iconUSASelected = false, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.logo,
              width: double.infinity,
              height: height * .27,
            ),
            CustomTextFieldLogin(
              text: "Email",
              prefixIcon: Image.asset(AppAssets.emailIcon),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextFieldLogin(
              text: "Password",
              suffixIcon: Image.asset("assets/icons/🦆 icon _eye off_.png"),
              prefixIcon: Image.asset(AppAssets.passwordIcon),
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
                Expanded(
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
                Expanded(
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
            Center(
              child: Container(
                width: width * 0.21,
                height: height * 0.04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1.5, color: AppColor.orange)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        widget.iconUSASelected = true;
                        widget.iconEGSelected = false;

                        setState(() {});
                      },
                      child: widget.iconUSASelected
                          ? SelectedContainerForLocalization(
                              iconSelected: Image.asset(AppAssets.usIcon),
                            )
                          : Container(
                              child: Image.asset(AppAssets.usIcon),
                              decoration: BoxDecoration(
                                color: AppColor.orange,
                                borderRadius: BorderRadius.circular(16),
                                // border: Border.all(width: 1.8, color: AppColor.orange),
                              ),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.iconEGSelected = true;
                        widget.iconUSASelected = false;

                        setState(() {});
                      },
                      child: widget.iconEGSelected
                          ? SelectedContainerForLocalization(
                              iconSelected: Image.asset(AppAssets.egIcon),
                            )
                          : Container(
                              child: Image.asset(AppAssets.egIcon),
                              decoration: BoxDecoration(
                                color: AppColor.orange,
                                borderRadius: BorderRadius.circular(16),
                                // border: Border.all(width: 1.8, color: AppColor.orange),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedContainerForLocalization extends StatelessWidget {
  Widget iconSelected;
  SelectedContainerForLocalization({
    required this.iconSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: iconSelected,
      decoration: BoxDecoration(
        color: AppColor.orange,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.8, color: AppColor.orange),
      ),
    );
  }
}

class Custom_Elevated_Button_login extends StatelessWidget {
  bool isIcon;
  String text;
  String? icon;
  TextStyle? style;
  Custom_Elevated_Button_login({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: ElevatedButton(
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
                isIcon ? Image.asset(icon!) : SizedBox.shrink(),
                isIcon
                    ? SizedBox(
                        width: width * 0.02,
                      )
                    : SizedBox.shrink(),
                Text(
                  text,
                  style: style,
                ),
              ],
            ),
          ))),
    );
  }
}

class CustomTextFieldLogin extends StatelessWidget {
  String text;
  Widget prefixIcon;
  Widget? suffixIcon;
  CustomTextFieldLogin({
    this.suffixIcon,
    required this.prefixIcon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: text,
            prefixIcon: prefixIcon,
            hintStyle: AppStyles.normal16white,
            fillColor: AppColor.semiBlack,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
