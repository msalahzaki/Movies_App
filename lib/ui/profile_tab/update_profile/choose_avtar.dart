import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_viewmodel.dart';

import '../../../utils/app_color.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar(this.viewmodel,
      {super.key});
  final UpdateProfileViewmodel viewmodel ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return BlocProvider<UpdateProfileViewmodel>(
      create: (context) => UpdateProfileViewmodel(),
      child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColor.semiBlack),
          child: GridView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.hardEdge,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              String imagePath = "assets/images/avatar${index + 1}.png";
              return InkWell(
                onTap: () {
                  viewmodel.changeAvatar(index+1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: viewmodel.profileAvatar == index +1
                        ? AppColor.orange.withOpacity(.5)
                        : AppColor.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: AppColor.orange, width: 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: size.width * .9,
                  ),
                ),
              );
            },
          )),
    );
  }
}
