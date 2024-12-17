import 'dart:convert';
import 'package:movies_app/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';

class SimilarApiDataSource {
  Future<MovieSimilar> getMovieSmiliar(String MovieId) async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.MovieDetailEndPoint + MovieId + '/similar',
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.apiKey,
    });
    final json = jsonDecode(response.body);
    final MovieDetails = MovieSimilar.fromJson(json);
    return MovieDetails;
  }
}
