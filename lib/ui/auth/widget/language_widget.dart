import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/utils/app_color.dart';

import '../../../cubit/language_cubit.dart';
import '../../../utils/app_assets.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {

  late Size size;

  @override
  Widget build(BuildContext context) {


    size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.orange, width: 2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () {
                context.read<LanguageCubit>().changeLanguage(language: "en");
                setState(() {});
              },
              child: languageOption(AppAssets.usIcon, "en")),
          const SizedBox(
            width: 15,
          ),
          InkWell(
              onTap: () {
                context.read<LanguageCubit>().changeLanguage(language: "ar");
                setState(() {});
              },
              child: languageOption(AppAssets.egIcon, "ar")),
        ],
      ),
    );
  }

  Widget languageOption(String url, String value) {
    return CircleAvatar(
      backgroundColor:   context.read<LanguageCubit>().language == value
          ? AppColor.orange
          : AppColor.transparent,
      maxRadius: 18,
      child: Image.asset(
        url,
        height: size.height * 0.04,
      ),
    );
  }
}