import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';

class Similarmoviesitem extends StatelessWidget {
  Results SimilarMovie;

  Similarmoviesitem(this.SimilarMovie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: SimilarMovie.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 150,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                'https://image.tmdb.org/t/p/w200${SimilarMovie.backdropPath}' ??
                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommons.wikimedia.org%2Fwiki%2FFile%3ANo_Image_Available.jpg&psig=AOvVaw3rlnQoNLNgwcx3Q_GiBYtA&ust=1734380503060000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCND9ps7aqooDFQAAAAAdAAAAABAE',
                fit: BoxFit.fitHeight,
                height: 100,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppTheme.goldenYellow,
                ),
                Text(
                  '${SimilarMovie.voteAverage}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(SimilarMovie.title ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text('${SimilarMovie.releaseDate?.split('-').first ?? ''}',
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(
                  width: 3,
                ),
                SizedBox(
                  width: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
