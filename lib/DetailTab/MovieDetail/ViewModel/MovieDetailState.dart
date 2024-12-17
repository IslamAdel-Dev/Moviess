import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';

abstract class Moviedetailstate {}

class MovieDetailinit extends Moviedetailstate {}

class MovieDetailLoading extends Moviedetailstate {}

class getMovieDetailSuccess extends Moviedetailstate {
  final MovieDetail MovieDetails;
  getMovieDetailSuccess(this.MovieDetails);
}

class getMovieDetailError extends Moviedetailstate {
  String Error;
  getMovieDetailError(this.Error);
}
