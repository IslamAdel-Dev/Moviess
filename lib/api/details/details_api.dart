import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:movies/api/details/details_api_constants.dart';
import 'package:movies/models/response_details/details_res/details_res.dart';
import 'package:movies/models/similar/similar_response.dart';

class DetailsApi {
  static Future<DetailsRes> getMovieDetails(int id) async {
  try {
    final uri = Uri.https(
      DetailsApiConstants.baseurl,
      '${DetailsApiConstants.sourceEndPoint}$id',
      {'api_key': DetailsApiConstants.api_key},
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print('Error: ${response.body}');
      throw Exception('Failed to load movie details: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);
    return DetailsRes.fromJson(json);
  } catch (e) {
    print('Network Error: $e');
    throw Exception('Failed to load movie details: $e');
  }
}
static Future<SimilarResponse> getMovieSimilars(int id) async {
  try {
    final uri = Uri.https(
      DetailsApiConstants.baseurl,
      '${DetailsApiConstants.sourceEndPoint}$id/similar',
      {'api_key': DetailsApiConstants.api_key},
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print('Error: ${response.body}');
      throw Exception('Failed to load movie details: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);
    return SimilarResponse.fromJson(json);
  } catch (e) {
    print('Network Error: $e');
    throw Exception('Failed to load movies: $e');
  }
}


}