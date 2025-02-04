import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyles {

  ///Primary Fonts
  static TextStyle normal14primary = GoogleFonts.roboto(color: AppColor.orange, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle normal16primary = GoogleFonts.roboto(color: AppColor.orange, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle normal20primary = GoogleFonts.roboto(color: AppColor.orange, fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle bold14primary = GoogleFonts.roboto(color: AppColor.orange, fontSize: 14, fontWeight: FontWeight.w800);

  ///Black Fonts
  static TextStyle normal16black = GoogleFonts.roboto(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle normal20black = GoogleFonts.roboto(color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle bold14black = GoogleFonts.roboto(color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle bold20black = GoogleFonts.roboto(color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle bold24black = GoogleFonts.roboto(color: AppColor.black, fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle bold16black = GoogleFonts.roboto(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w700);

 static TextStyle normal16gray = GoogleFonts.roboto(color: AppColor.gray, fontSize: 16);

  /// White Fonts
  static TextStyle normal16white = GoogleFonts.roboto(color: AppColor.white, fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle normal14white = GoogleFonts.roboto(color: AppColor.white, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle normal20white = GoogleFonts.roboto(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle normal36white = GoogleFonts.roboto(color: AppColor.white, fontSize: 36, fontWeight: FontWeight.w500);

  static TextStyle bold24white = GoogleFonts.roboto(color: AppColor.white, fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle bold20white = GoogleFonts.roboto(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle bold16white = GoogleFonts.roboto(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700);

  static TextStyle light20White = GoogleFonts.roboto(
      color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle light20semiWhite = GoogleFonts.roboto(
      color: AppColor.semiWhite, fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle medium20Black = GoogleFonts.roboto(
      color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle medium20Orange = GoogleFonts.roboto(
      color: AppColor.orange, fontSize: 20, fontWeight: FontWeight.w600);
}
