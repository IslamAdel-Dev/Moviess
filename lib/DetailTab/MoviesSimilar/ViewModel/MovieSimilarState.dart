import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';

abstract class MovieSimilarstate {}

class MovieSimilarinit extends MovieSimilarstate {}

class MovieSimilarLoading extends MovieSimilarstate {}

class getMovieSimilarSuccess extends MovieSimilarstate {
  final MovieSimilar MovieSimilars;
  getMovieSimilarSuccess(this.MovieSimilars);
}

class getMovieSimilarError extends MovieSimilarstate {
  String Error;
  getMovieSimilarError(this.Error);
}
