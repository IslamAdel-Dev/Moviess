import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/Details/MovieDetail/View/Widget/CategoryMovieDetails.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/View/Widget/SimilarMoviesList.dart';

class MovieDetailTab extends StatelessWidget {
  final MovieDetail MovieDetails;
  MovieDetailTab(this.MovieDetails);

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    print(MovieDetails.overview);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppTheme.white,
        ),
        title: Text(MovieDetails.originalTitle ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Height * 0.25,
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${MovieDetails.backdropPath}',
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                child: Icon(
                  Icons.play_circle,
                  size: 60,
                  color: AppTheme.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MovieDetails.originalTitle ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      MovieDetails.releaseDate?.split('-').first ?? '',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '     ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '     ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: Height * 0.23,
                  child: Row(
                    children: [
                      SizedBox(
                        height: Height * 0.23,
                        width: Width * 0.32,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200${MovieDetails.posterPath}',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MovieDetails.genres!.length > 3
                                  ? Height * 0.09
                                  : Height * 0.05,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5),
                                itemBuilder: (_, index) =>
                                    MovieDetails.genres == null
                                        ? SizedBox()
                                        : Categorymoviedetails(
                                            MovieDetails.genres![index]),
                                itemCount: MovieDetails.genres?.length ?? 0,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: AutoSizeText(
                                  MovieDetails.overview ?? '',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  maxFontSize: 18,
                                  minFontSize: 13,
                                  maxLines: 7,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppTheme.brightYellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(MovieDetails.voteAverage.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, left: 20),
            decoration: BoxDecoration(color: AppTheme.deepGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More Like This',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 8,
                ),
                SimilarMoviesList(MovieDetails.id.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
