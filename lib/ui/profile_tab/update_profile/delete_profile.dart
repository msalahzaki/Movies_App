import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/update_profile/cubit/update_profile_viewmodel.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ConfirmDeleteDialog {

  static void show(BuildContext context, UpdateProfileViewmodel viewmodel) {
    var local = AppLocalizations.of(context)!;
     int randomCode = Random().nextInt(1000) + 100;
    TextEditingController codeController = TextEditingController();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,

      body: Column(
        children: [
           Text(local.deleteProfileWarning, style: AppStyles.normal16black),
          Text("${local.typeNumberToConfirm} $randomCode ", style: AppStyles.normal20black),

          const SizedBox(height: 10),
          TextField(style: AppStyles.normal20white,
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              hintText: local.enterTheNumber,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      btnCancelText: local.cancel,
        btnOkText: local.delete,
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
            title: local.error,
            desc: local.incorrectNumber,
            autoHide: const Duration(seconds: 2),
           dismissOnTouchOutside: false
          ).show();
        }
      },

    ).show();
  }
}
