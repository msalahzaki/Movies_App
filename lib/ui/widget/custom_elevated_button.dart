import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Widget? iconButton;
  String? text;
  TextStyle textStyle;
  Color? borderSide;
  Function onButtonClicked;

  CustomElevatedButton(
      {this.backgroundColor,
      this.iconButton,
      this.text,
      required this.textStyle,
      this.borderSide,
      required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.015, horizontal: width * 0.33),
            backgroundColor: backgroundColor ?? AppColor.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                    color: borderSide ?? AppColor.orange, width: 2))),
        onPressed: () {
          onButtonClicked();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconButton ?? SizedBox(),
            Text(
              text ?? '',
              style: textStyle,
            )
          ],
        ));
  }
}
