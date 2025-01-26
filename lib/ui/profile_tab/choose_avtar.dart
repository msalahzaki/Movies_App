import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar(
      {super.key, required this.currentAvatar, required this.changeAvatar});
  final String currentAvatar;
  final Function(String) changeAvatar;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                changeAvatar(imagePath);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: currentAvatar == imagePath
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
        ));
  }
}
