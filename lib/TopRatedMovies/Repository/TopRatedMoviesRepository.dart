import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movies_app/TopRatedMovies/data/data_Source/Top_rated_Api_data_Source.dart';

class TopRatedMoviesRepository {
  final topRatedMoviess = TopRatedAPiMovies();

  Future<List<topRatedMovie>> getTopRatedMovies() async {
    return topRatedMoviess.getTopRatedMovies();
  }
}
