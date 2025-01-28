import 'package:flutter/material.dart';
import 'package:movies_app/ui/login/login_screen.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/utils/custom_elevated_button.dart';
import 'package:movies_app/utils/custom_text_field.dart';

class RegisterScreenView extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  bool obsecure = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: AppStyles.normal16primary,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.037,
        ),
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: 9,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/images/avatar${index + 1}.png',
                      fit: BoxFit.fill,),
                  );
                },
                options: CarouselOptions(
                  height: height * 0.173,
                  viewportFraction: 0.38,
                  initialPage: 7,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                )
            ),
            SizedBox(height: height * 0.01,),
            Text('Avatar',style: AppStyles.normal16gray,),
            SizedBox(height: height * 0.012,),
            CustomTextField(
              hintText: 'Name',
              hintStyle: AppStyles.normal16white,
              style: AppStyles.normal16white,
              prefixIcon: ImageIcon(AssetImage(AppAssets.nameIcon)),
            ),
            SizedBox(height: height * 0.025,),
            CustomTextField(
              hintText: 'Email',
              hintStyle: AppStyles.normal16white,
              style: AppStyles.normal16white,
              prefixIcon: ImageIcon(AssetImage(AppAssets.emailIcon)),
            ),
            SizedBox(height: height * 0.025,),
            CustomTextField(
              obscureText: obsecure,
              hintText: 'Password',
              hintStyle: AppStyles.normal16white,
              style: AppStyles.normal16white,
              prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
              suffixIcon: IconButton(onPressed: (){
                obsecure = !obsecure;
                setState(() {
                });
              },icon: Icon(obsecure?Icons.visibility_off:Icons.visibility),),
            ),
            SizedBox(height: height * 0.025,),
            CustomTextField(
              obscureText: obsecure,
              hintText: 'Confirm Password',
              hintStyle: AppStyles.normal16white,
              style: AppStyles.normal16white,
              prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
              suffixIcon: IconButton(onPressed: (){
                obsecure = !obsecure;
                setState(() {
                });
              },icon: Icon(obsecure?Icons.visibility_off:Icons.visibility),),
            ),
            SizedBox(height: height * 0.025,),
            CustomTextField(

              hintText: 'Phone Number',
              style: AppStyles.normal16white,
              hintStyle: AppStyles.normal16white,
              prefixIcon: ImageIcon(AssetImage(AppAssets.phoneIcon)),
            ),
            SizedBox(height: height * 0.025,),
            CustomElevatedButton(
              onButtonClicked: createAccount,
              buttonText: 'Create Account',
              textStyle: AppStyles.normal20black,
            ),
            SizedBox(height: height * 0.025,),
            InkWell(
              onTap: () {
                // todo : Navigate To Login Screen -> PushReplacementNamed
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      children: [
                        TextSpan(text: 'Already Have Account ? ',
                            style: AppStyles.normal14white),
                        TextSpan(text: 'Login',
                            style: AppStyles.normal14primary)
                      ]
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
void createAccount(){
  // todo : create account function
}
