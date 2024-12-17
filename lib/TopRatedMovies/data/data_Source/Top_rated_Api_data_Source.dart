import 'dart:convert';
import 'package:movies_app/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/TopRatedMovies/data/Models/top_rated_movies.dart';

class TopRatedAPiMovies {
  Future<List<topRatedMovie>> getTopRatedMovies() async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.TopRatedMoviesEndpoint,
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.apiKey,
    });
    final json = jsonDecode(response.body);
    final topRatedMovies = TopRatedMovies.fromJson(json);
    if (topRatedMovies.topRatedMovies != null) {
      return topRatedMovies.topRatedMovies;
    } else {
      throw Exception('Failed get Top Rated Movies');
    }
  }
}
