import 'package:flutter/material.dart';
import 'package:movies_app/model/MoviesResponse.dart';
import 'package:movies_app/ui/explorer_tab/source/source_movies.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_styles.dart';

class ExplorerTab extends StatefulWidget {
   ExplorerTab({this.selectedIndex=0 ,super.key});
  int selectedIndex ;
  @override
  State<ExplorerTab> createState() => _ExplorerTabState();
}

class _ExplorerTabState extends State<ExplorerTab> {
  //List<Movies>? movieList;

  @override
  Widget build(BuildContext context) {
   // var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SourceMovies(selectedIndex:widget.selectedIndex ,),
    );
  }
}

class UnSelectedTab extends StatelessWidget {
  final String text;
  UnSelectedTab({
    required this.text,
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.orange),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Text(
          text,
          style: AppStyles.normal20primary,
        ),
      ),
    );
  }
}

class SelectedTab extends StatelessWidget {
  final String text;

  SelectedTab({
    required this.text,
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.orange, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Text(
          text,
          style: AppStyles.bold20black,
        ),
      ),
    );
  }
}
