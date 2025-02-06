import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/reset_password_state.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/reset_view_model.dart';
import 'package:movies_app/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = "Reset Password";
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool obsecure = true;
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => ResetPasswordCubit(),
          child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                Fluttertoast.showToast(msg: state.message);
                Navigator.pop(context);
              } else if (state is ResetPasswordFailure) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset("assets/images/forgotPassword.png"),
                    TextFormField(
                      controller: oldPasswordController,
                      obscureText: obsecure,
                      style: const TextStyle(color: AppColor.white),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: AppColor.semiBlack,
                          hintStyle: const TextStyle(color: AppColor.white),
                          hintText: 'Old Password'),
                      validator: (value) =>
                          value!.isEmpty ? "Old password is required" : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: obsecure,
                      style: const TextStyle(color: AppColor.white),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: AppColor.semiBlack,
                          hintStyle: const TextStyle(color: AppColor.white),
                          hintText: 'New Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "New password is required";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Must contain at least one uppercase letter";
                        }
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return "Must contain at least one lowercase letter";
                        }
                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return "Must contain at least one number";
                        }
                        if (!RegExp(r'[@$!%*?&]').hasMatch(value)) {
                          return "Must contain at least one special character (@, \$, !, %, *, ?, &)";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(color: AppColor.white),
                      controller: confirmPasswordController,
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: AppColor.semiBlack,
                          hintStyle: const TextStyle(color: AppColor.white),
                          hintText: 'Confirm New Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required";
                        }
                        if (value != newPasswordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state is ResetPasswordLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ResetPasswordCubit>(context)
                                    .resetPassword(
                                  oldPasswordController.text,
                                  newPasswordController.text,
                                );
                              }
                            },
                      child: state is ResetPasswordLoading
                          ? const CircularProgressIndicator()
                          :  Text('Reset Password',style: AppStyles.normal16black,),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
