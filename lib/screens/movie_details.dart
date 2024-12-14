import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/appTheme.dart';
import 'package:movies/api/details/details_api.dart';
import 'package:movies/models/response_details/details_res/details_res.dart';
import 'package:movies/models/similar/similar_response.dart';
import 'package:movies/widgets/movie_genres.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({required this.movieId, Key? key}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<DetailsRes>(
      future: DetailsApi.getMovieDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: Text('No movie details available'),
            ),
          );
        }

        final movie = snapshot.data!;
        Future<SimilarResponse> movieSimilar = DetailsApi.getMovieSimilars(movieId);

        return SafeArea(
          child: Scaffold(
            backgroundColor: AppTheme.darkBlack,
            appBar: AppBar(
              title: Text(
                movie.title ?? "Unknown Title",
                style: const TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Top Movie Banner
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.25,
                        padding: const EdgeInsets.all(5),
                        child: CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: width * 0.43,
                        child: Icon(Icons.play_circle, color: Colors.white, size: 50),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Movie Details
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          movie.title ?? "Unknown Title",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Release Date and Runtime
                        Row(
                          children: [
                            Text(
                              movie.releaseDate != null && movie.releaseDate!.length >= 4
                                  ? movie.releaseDate!.substring(0, 4)
                                  : "Unknown Year",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${movie.runtime ?? 0} minutes',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Movie Poster and Overview
                        Container(
                          height: height * 0.25,
                          width: width,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 3,
                                top: 0,
                                child: Container(
                                  height: 200,
                                  width: width * 0.33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 130,
                                right: 10,
                                child: SizedBox(
                                  height: 90,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        movie.overview!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 130,
                                right: 0,
                                child: Container(
                                  height: 80,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 3,
                                    ),
                                    itemCount: movie.genres!.length,
                                    itemBuilder: (context, index) {
                                      return MovieGenres(genre: movie.genres![index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Average Rating
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? "N/A"}",
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          color: Colors.grey,
                          child: Text('More like this' , style: TextStyle(fontSize: 16 , color: AppTheme.white),),
                        ),

                        Container(
                          height: 200,
                          color: Colors.grey,
                          child: FutureBuilder<SimilarResponse>(
                            future: movieSimilar,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.results!.isEmpty) {
                                return const Center(
                                    child: Text('No similar movies found.'));
                              }

                              final movieList = snapshot.data!.results;

                              return SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movieList!.length,
                                  itemBuilder: (context, index) {
                                    final movie = movieList[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              "https://image.tmdb.org/t/p/w92${movie.posterPath ?? ''}",
                                              width: 100,
                                              height: 140,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Icon(Icons.error,
                                                    size: 100);
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              movie.title ?? "No title",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
