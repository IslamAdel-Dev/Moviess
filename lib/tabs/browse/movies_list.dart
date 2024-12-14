import 'package:flutter/material.dart';
import 'package:movies/api/api.dart';
import 'package:movies/appTheme.dart';

class MoviesListScreen extends StatelessWidget {
  final int genreId;
  final String genreName;

  const MoviesListScreen({
    super.key,
    required this.genreId,
    required this.genreName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          genreName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.white,
              ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchMoviesByGenre(genreId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No movies available',
              ),
            );
          }

          final movies = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              final releaseDate = movie['release_date'] ?? 'Unknown';

              return ListTile(
                title: Text(
                  movie['title'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.white,
                      ),
                ),
                subtitle: Text(
                  'Release Date: $releaseDate',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppTheme.white.withOpacity(0.67),
                      ),
                ),
                leading: Image.asset(
                  'assets/images/action.png',
                  fit: BoxFit.cover,
                  width: 50,
                  height: 75,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
