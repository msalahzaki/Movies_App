import 'package:flutter/material.dart';
import 'package:movies_app/ui/profile_tab/update_profile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const UpdateProfile();
  }
}
