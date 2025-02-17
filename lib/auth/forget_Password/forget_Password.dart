import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "Forget Password";

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title:  Text(local.forgot_password),
      ),
      backgroundColor: AppColor.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Image.asset("assets/images/forgotPassword.png"),
            SizedBox(
              width: width*0.8,
              child: TextFormField(
                style: const TextStyle(color: AppColor.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.semiBlack,
                    hintText: local.email,
                    hintStyle: const TextStyle(color: AppColor.white),
                    prefixIcon: Image.asset("assets/images/emailIcon.png"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(height: height*0.03,),
            MaterialButton(
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              height: height*0.065,
              minWidth: width*0.8,
              color: AppColor.orange,
              onPressed: () {
                //
              },
              child: Text(local.verify,style: AppStyles.normal20black),
            ),
          ],
        ),
      ),
    );
  }
}