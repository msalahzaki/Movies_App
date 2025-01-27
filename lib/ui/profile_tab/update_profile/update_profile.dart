import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/update_profile/choose_avtar.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_states.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_viewmodel.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late UpdateProfileViewmodel viewmodel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: BlocProvider(
        create:(context) => UpdateProfileViewmodel() ,
        child: BlocConsumer<UpdateProfileViewmodel,UpdateProfileStates>(
          listener: (context, state) {
            if(state is UpdateProfileShowModalSheetState){
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return ChooseAvatar(viewmodel);
                },
              );
            }else if (state is UpdateProfileHideModalSheetState){
              Navigator.pop(context);
            }
          },

          builder: (context, state) {
            viewmodel = context.read<UpdateProfileViewmodel>();
             return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: () {
                      viewmodel.showModalSheetState();
                    },
                    icon: Image.asset(
                      viewmodel.profileAvatar,
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
                        onPressed: () {},
                        child: Text(
                          "Reset Password",
                          style: AppStyles.normal20white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
                    child: Text(
                      "Delete Account",
                      style: AppStyles.normal20white,
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Update Data",
                        style: AppStyles.normal20black,
                      )),
                  SizedBox(height: size.height * .02),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
