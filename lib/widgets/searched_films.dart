import 'package:flutter/material.dart';
import 'package:movies/api/search_api.dart';
import 'package:movies/models/response_search/search_source_response.dart';

class SearchedFilms extends StatefulWidget {
  const SearchedFilms({super.key, required this.movieName});
  final String movieName;

  @override
  State<SearchedFilms> createState() => _SearchedFilmsState();
}

class _SearchedFilmsState extends State<SearchedFilms> {
  late Future<SearchSourceResponse> movies;
  @override
  Widget build(BuildContext context) {
    movies = SearchApi.getSearchedMovies(widget.movieName);
    return FutureBuilder<SearchSourceResponse>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final movieList = snapshot.data!.results; // Access the movies list
          return ListView.builder(
            shrinkWrap: true, // Add shrinkWrap to allow ListView to adjust size
            physics: NeverScrollableScrollPhysics(), // Prevent inner scrolling
            itemCount: movieList!.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];
              return ListTile(
                leading: Image.network(
                  "https://image.tmdb.org/t/p/w92${movie.posterPath}",
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(movie.title ?? "No title available"),
              );
            },
          );
        } else {
          return Center(child: Text('No movies found.'));
        }
      },
    );
  }
}
