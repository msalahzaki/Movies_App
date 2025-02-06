import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_viewmodel.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class ConfirmDeleteDialog {

  static void show(BuildContext context, UpdateProfileViewmodel viewmodel) {

     int randomCode = Random().nextInt(1000) + 100;
    TextEditingController codeController = TextEditingController();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,

      body: Column(
        children: [
           Text("You Are About To Delete Profile And No Way To Undo Action ", style: AppStyles.normal16black),
          Text("Type this number To Confirm: $randomCode ", style: AppStyles.normal20black),

          const SizedBox(height: 10),
          TextField(style: AppStyles.normal20white,
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter the number",
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      btnCancelText: "Cancel",
        btnOkText: "Delete",
        btnOkColor: AppColor.red,
        btnCancelColor: AppColor.green,
      btnCancelOnPress: (){},
      btnOkOnPress: () {
        if (codeController.text == randomCode.toString()) {
         viewmodel.deleteProfile();
        }
        else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: "Error",
            desc: "Incorrect number! Please try again.",
            autoHide: const Duration(seconds: 2),
           dismissOnTouchOutside: false
          ).show();
        }
      },

    ).show();
  }
}
