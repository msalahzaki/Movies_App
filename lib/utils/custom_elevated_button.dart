import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Widget? prefixIconButton;
  String? buttonText;
  TextStyle? textStyle;
  Color? borderColor;
  Function onButtonClicked;
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  CustomElevatedButton({super.key, required this.onButtonClicked, this.borderColor, this.textStyle, this.crossAxisAlignment, this.mainAxisAlignment, this.buttonText, this.backgroundColor, this.prefixIconButton});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(onPressed: (){
      onButtonClicked();
    },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.019
            ),
            backgroundColor: backgroundColor ?? AppColor.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: borderColor ?? AppColor.orange
              )
            )
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            prefixIconButton ?? const SizedBox(),
            SizedBox(width: width * 0.025,),
            Text(buttonText??'',style: textStyle ?? AppStyles.normal20white,),
          ],
        ));
  }

}
