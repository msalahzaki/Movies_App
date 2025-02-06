import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

class Custom_Elevated_Button_login extends StatelessWidget {
  final bool isIcon;
  final String text;
  final String? icon;
  final TextStyle? style;
  void Function()? ontab;
  Custom_Elevated_Button_login({
    this.ontab,
    this.isIcon = false,
    this.style,
    required this.text,
    this.icon,
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColor.orange),
        onPressed: ontab,
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.001),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon ? Image.asset(icon!) : const SizedBox.shrink(),
              isIcon
                  ? SizedBox(
                      width: width * 0.02,
                    )
                  : const SizedBox.shrink(),
              Text(
                text,
                style: style,
              ),
            ],
          ),
        )));
  }
}
