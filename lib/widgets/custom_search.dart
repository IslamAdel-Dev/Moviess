import 'package:flutter/material.dart';
import 'package:movies/appTheme.dart';
import 'package:movies/widgets/searched_films.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = new TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.mediumDarkGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: search,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppTheme.white,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.white,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
