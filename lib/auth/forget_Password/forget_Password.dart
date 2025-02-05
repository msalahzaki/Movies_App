import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "Forget Password";

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      backgroundColor: AppColor.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Image.asset("assets/images/forgotPassword.png"),
            SizedBox(
              width: Width*0.8,
              child: TextFormField(
                style: const TextStyle(color: AppColor.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.semiBlack,
                    hintText: "Email",
                    hintStyle: const TextStyle(color: AppColor.white),
                    prefixIcon: Image.asset("assets/images/emailIcon.png"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(height: Height*0.03,),
            MaterialButton(
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              height: Height*0.065,
              minWidth: Width*0.8,
              color: AppColor.orange,
              onPressed: () {
                //
              },
              child: Text("Verify Email",style: AppStyles.normal20black),
            ),
          ],
        ),
      ),
    );
  }
}