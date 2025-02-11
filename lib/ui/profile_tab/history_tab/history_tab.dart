import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Center(
          child: Image.asset(AppAssets.emptyBG),
        ),
      ),
    );
  }
}
