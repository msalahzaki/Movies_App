import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/auth/register/cubit/register_states.dart';
import 'package:movies_app/auth/register/cubit/register_view_model.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/custom_dailog.dart';
import 'package:movies_app/utils/custom_elevated_button.dart';
import 'package:movies_app/utils/custom_text_field.dart';
import '../widget/language_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreenView extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterViewModel, RegisterState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              local.register,
              style: AppStyles.normal16primary,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.037,
              ),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: 9,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'assets/images/avatar${index + 1}.png',
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            viewModel.selectedAvatar = index + 1;
                            print(
                                'Selected Avatar : ${viewModel.selectedAvatar}');
                          },
                          height: height * 0.173,
                          viewportFraction: 0.38,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      local.avatar,
                      style: AppStyles.normal16gray,
                    ),
                    SizedBox(
                      height: height * 0.012,
                    ),
                    CustomTextField(
                      validator: (text) {
                        return viewModel.validName(text);
                      },
                      controller: viewModel.name,
                      hintText: local.name,
                      hintStyle: AppStyles.normal16white,
                      style: AppStyles.normal16white,
                      prefixIcon: ImageIcon(AssetImage(AppAssets.nameIcon)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomTextField(
                      validator: (text) {
                        return viewModel.validEmail(text);
                      },
                      controller: viewModel.email,
                      hintText: local.email,
                      keyboardType: TextInputType.emailAddress,
                      hintStyle: AppStyles.normal16white,
                      style: AppStyles.normal16white,
                      prefixIcon: ImageIcon(AssetImage(AppAssets.emailIcon)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomTextField(
                      validator: (text) {
                        return viewModel.validPassword(text);
                      },
                      controller: viewModel.password,
                      obscureText: viewModel.obSecure,
                      hintText: local.password,
                      hintStyle: AppStyles.normal16white,
                      style: AppStyles.normal16white,
                      prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
                      suffixIcon: IconButton(
                        onPressed: viewModel.changePasswordIcon,
                        icon: Icon(viewModel.obSecure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomTextField(
                      validator: (text) {
                        return viewModel.validRePassword(text);
                      },
                      controller: viewModel.confirmPassword,
                      obscureText: viewModel.obSecure,
                      hintText: local.confirm_password,
                      hintStyle: AppStyles.normal16white,
                      style: AppStyles.normal16white,
                      prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
                      suffixIcon: IconButton(
                        onPressed: viewModel.changePasswordIcon,
                        icon: Icon(viewModel.obSecure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomTextField(
                      validator: (text) {
                        return viewModel.validPhoneNumber(text);
                      },
                      controller: viewModel.phone,
                      hintText: local.phone_number,
                      style: AppStyles.normal16white,
                      hintStyle: AppStyles.normal16white,
                      prefixIcon: ImageIcon(AssetImage(AppAssets.phoneIcon)),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomElevatedButton(
                      onButtonClicked: viewModel.register,
                      buttonText: local.register,
                      textStyle: AppStyles.normal20black,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InkWell(
                      onTap: () {

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                      child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(children: [
                            TextSpan(
                                text:  local.already_have_account,
                                style: AppStyles.normal14white),
                            TextSpan(
                                text: local.login, style: AppStyles.normal14primary)
                          ])),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    const Center(child: LanguageWidget()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          CustomDailog.showLoading(context);
        } else if (state is RegisterErrorState) {
          CustomDailog.hideLoading(context);

          CustomDailog.showAwesomeErrorMessageDialog(
              context: context, massage: state.errorMessage, okFunction: () {});
          // CustomDailog.showMessageDailog(context,
          //     message: state.errorMessage,
          //     title: 'Error',
          //     firstButtonLabel: 'Ok',
          //     firstButtonAction: () => Navigator.of(context).pop()
          // );
        } else if (state is RegisterSuccessState) {
          CustomDailog.hideLoading(context);
          CustomDailog.showAwesomeSuccessMessageDialog(
              context: context,
              massage: state.successMessage,
              okText: 'Go To '+local.login,
              okFunction: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
              });
          //
          // CustomDailog.showMessageDailog(context,
          //     title: 'Success',
          //     message: state.successMessage,
          //     firstButtonLabel: 'Go To Login',
          //     firstButtonAction: () => Navigator.of(context).pushReplacementNamed(LoginScreen.loginScreenId)
          // );
        }
      },
    );
  }
}
