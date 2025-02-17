import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/forget_Password/forget_Password.dart';
import 'package:movies_app/auth/login/Custom_elevated_Button_login.dart';
import 'package:movies_app/auth/login/cubit/login_states.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/auth/register/register_screen_view.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/custom_dailog.dart';
import 'package:movies_app/utils/dailog_utilis.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../auth/widget/language_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenId = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    LoginViewModel loginViewModel = BlocProvider.of<LoginViewModel>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: loginViewModel,
      child: BlocListener<LoginViewModel, LoginStates>(
          listener: (context, state) {
            if (state is FailureLoginState) {
              DailogUtilis.hideLoading(context: context);
              CustomDailog.showAwesomeErrorMessageDialog(
                  context: context, massage: state.message, okFunction: () {});
            } else if (state is SucessLoginState) {
              DailogUtilis.hideLoading(context: context);
              CustomDailog.showAwesomeSuccessMessageDialog(
                  context: context,
                  massage: state.message,
                  okFunction: () {
                    loginViewModel.goToHome(context);
                  });
            } else if (state is LoadingLoginState) {
              DailogUtilis.showLoading(context: context, message: local.logging_in);
            }
          },
          child: Scaffold(
            body: Form(
              key: loginViewModel.formkey,
              child: SingleChildScrollView(
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
                          controller: loginViewModel.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return local.email_is_required;
                            }

                            return null;
                          },
                          style: AppStyles.normal20white,
                          decoration: InputDecoration(
                            hintText: local.email,
                            prefixIcon: Image.asset(AppAssets.emailIcon),
                          )),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        controller: loginViewModel.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return local.password_is_required;
                          }

                          return null;
                        },
                        style: AppStyles.normal20white,
                        obscureText: obsecure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              obsecure = !obsecure;
                              setState(() {});
                            },
                            icon: Icon(obsecure
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          prefixIcon: Image.asset(AppAssets.passwordIcon),
                          hintText: local.password,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ));
                          },
                          child: Text(
                            local.forgot_password,
                            style: AppStyles.normal14primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Custom_Elevated_Button_login(
                          ontab: () {
                            loginViewModel.login();
                          },
                          style: AppStyles.normal20black,
                          text: local.login,
                          width: width,
                          height: height),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreenView(),
                                ));
                          },
                          child: Text.rich(TextSpan(children: <InlineSpan>[
                            TextSpan(
                              text: local.dont_have_account,
                              style: AppStyles.normal14white,
                            ),
                            TextSpan(
                              text: local.create_account,
                              style: AppStyles.normal14primary,
                            )
                          ])),
                        ),
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
                          ontab: () {
                            loginViewModel.login();
                          },
                          isIcon: true,
                          icon: AppAssets.googleIcon,
                          style: AppStyles.normal16black,
                          text: local.google_sign_in,
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
            ),
          )),
    );
  }
}
