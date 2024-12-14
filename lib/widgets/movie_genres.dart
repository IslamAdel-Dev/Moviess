import 'package:flutter/material.dart';

import 'package:movies/models/response_details/details_res/genre.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({required this.genre});
  final Genre genre; 


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey
        )
        
      ),
      child: Center(child: Text(genre.name!, style: TextStyle(color: Colors.white , fontSize: 10),)),

    );
  }
}