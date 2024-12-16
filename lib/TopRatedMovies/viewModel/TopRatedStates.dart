import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';

abstract class topRatedStates {}

class TopRatedMoviessinit extends topRatedStates {}

class getTopRatedMoviesLoading extends topRatedStates {}

class getTopRatedMoviesSuccess extends topRatedStates {
  final List<topRatedMovie> TopRatedMovie;
  getTopRatedMoviesSuccess(this.TopRatedMovie);
}

class getTopRatedMoviesError extends topRatedStates {
  String Error;
  getTopRatedMoviesError(this.Error);
}
