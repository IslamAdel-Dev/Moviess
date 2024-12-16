import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/data_Source/details_api_data_source.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/data/data_Source/Similar_api_data_source.dart';

class MovieSimilarrepository {
  final MovieDetailApi = SimilarApiDataSource();

  Future<MovieSimilar> getMovieSimilar(String MoiveId) async {
    return await MovieDetailApi.getMovieSmiliar(MoiveId);
  }
}
