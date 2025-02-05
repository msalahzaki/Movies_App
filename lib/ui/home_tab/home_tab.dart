import 'package:flutter/material.dart';
import 'package:movies_app/ui/movies/genres_widget.dart';
import 'package:movies_app/ui/movies/movies_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [const MoviesWidget(), GenresWidget()],
          ),
        ),
      ),
    ));
  }
}
