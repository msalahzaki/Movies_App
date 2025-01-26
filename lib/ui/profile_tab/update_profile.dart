import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/choose_avtar.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String profileAvatar = AppAssets.avatar2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController nameEditingController =
        TextEditingController(text: "John Safwat");
    TextEditingController phoneEditingController =
        TextEditingController(text: "010000156");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return  ChooseAvatar(currentAvatar: profileAvatar,changeAvatar:changeAvatar ,);
                  },
                );

              },
              icon: Image.asset(
                profileAvatar,
                height: size.height * .15,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            TextFormField(
              style: AppStyles.normal20white,
              controller: nameEditingController,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.userIcon),
              ),
            ),
            SizedBox(height: size.height * .02),
            TextFormField(
              style: AppStyles.normal20white,
              controller: phoneEditingController,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.phoneIcon),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reset Password",
                    style: AppStyles.normal20white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
              child: Text(
                "Delete Account",
                style: AppStyles.normal20white,
              ),
            ),
            SizedBox(height: size.height * .02),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Update Data",
                  style: AppStyles.normal20black,
                )),
            SizedBox(height: size.height * .02),
          ],
        ),
      ),
    );
  }
  changeAvatar(String newPath){
    profileAvatar = newPath;
    setState(() {

    });

  }
}
