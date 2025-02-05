import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/login/login_screen.dart';
import 'package:movies_app/ui/profile_tab/cubit/profile_tab_viewModel.dart';
import 'package:movies_app/ui/profile_tab/update_profile/choose_avtar.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_states.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_viewmodel.dart';
import 'package:movies_app/ui/profile_tab/update_profile/delete_profile.dart';
import 'package:movies_app/ui/profile_tab/update_profile/resetPassword/reset_Password.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/custom_dailog.dart';

class UpdateProfile extends StatelessWidget {


  const UpdateProfile( {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late UpdateProfileViewmodel viewmodel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: BlocProvider(
        create:(context) => UpdateProfileViewmodel(),
        child: BlocConsumer<UpdateProfileViewmodel,UpdateProfileStates>(
          listener: (context, state) {
            if (state is UpdateProfileChangeAvatarState){
              Navigator.pop(context);
            }
            else if (state is UpdateProfileLoadingState){
              return CustomDailog.showLoading(context);
            }
            else if (state is UpdateProfileErrorState){
              Navigator.pop(context);
              return CustomDailog.showAwesomeErrorMessageDialog(context: context,massage:  state.errorMassage);
            }
            else if (state is UpdateProfileSussesState){
              Navigator.pop(context);
              return CustomDailog.showAwesomeSuccessMessageDialog(context: context,massage: "Profile Update Successful");
            }
            else if (state is DeleteProfileErrorState){
              Navigator.pop(context);
              return CustomDailog.showAwesomeErrorMessageDialog(context: context,massage:  state.errorMassage);
            }
            else if (state is DeleteProfileSuccessState){
              Navigator.pop(context);
              CustomDailog.showMessageDailog(context,message: "Profile Update Successful",firstButtonLabel: "ok");
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));

            }
          },

          builder: (context, state) {
            viewmodel = context.read<UpdateProfileViewmodel>();
            viewmodel.profileTabViewmodel = BlocProvider.of<ProfileTabViewmodel>(context);
            viewmodel.initProfileData();
            return  Form(
              key: viewmodel.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return ChooseAvatar(viewmodel);
                          },
                        );

                      },
                      icon: Image.asset("assets/images/avatar${viewmodel.profileAvatar}.png"
                        ,
                        height: size.height * .15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextFormField(
                      style: AppStyles.normal20white,
                      controller: viewmodel.nameEditingController,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(AppAssets.userIcon),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    TextFormField(
                      validator: (text){
                        return viewmodel.validatePhoneNumber(text);
                      },
                      keyboardType: TextInputType.phone,
                      style: AppStyles.normal20white,
                      controller: viewmodel.phoneEditingController,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(AppAssets.phoneIcon),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ResetPassword.routeName);
                          },
                          child: Text(
                            "Reset Password",
                            style: AppStyles.normal20white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        ConfirmDeleteDialog.show(context, viewmodel);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
                      child: Text(
                        "Delete Account",
                        style: AppStyles.normal20white,
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    ElevatedButton(
                        onPressed: () {
                          viewmodel.updateProfile();
                        },
                        child: Text(
                          "Update Data",
                          style: AppStyles.normal20black,
                        )),
                    SizedBox(height: size.height * .02),
                  ],
                ),
              ),
            );

          },

        ),
      ),
    );
  }
}