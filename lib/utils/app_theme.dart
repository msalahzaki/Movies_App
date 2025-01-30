import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColor.orange,
      scaffoldBackgroundColor: AppColor.black,
      appBarTheme:  AppBarTheme(
        backgroundColor: AppColor.black,
        centerTitle: true,
        titleTextStyle: AppStyles.normal16primary ,
        iconTheme: const IconThemeData(
          color: AppColor.orange
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.orange,
              textStyle: AppStyles.normal20white,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
  inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.semiBlack,
    hintStyle: AppStyles.normal16white,
    suffixIconColor: AppColor.white,
    prefixIconColor: AppColor.white,
      border: textInputBorder(),
      focusedBorder: textInputBorder(),
      enabledBorder: textInputBorder(),
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.semiBlack,
      selectedItemColor: AppColor.orange,
      showSelectedLabels:false,
      showUnselectedLabels:false,
      unselectedItemColor: AppColor.white
    )
      );



  static OutlineInputBorder textInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide());
  }
}
