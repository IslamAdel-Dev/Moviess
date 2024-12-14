import 'package:flutter/material.dart';
import 'package:movies/widgets/movie_carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  static const String routename = '/homescreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: height * 0.33,
        width: double.infinity,
        child: MovieCarousel(),
      ),
    );
  }
}
