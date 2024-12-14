import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/search_api_constants.dart';
import 'package:movies/models/response_search/search_source_response.dart';

class SearchApi {
  static Future<SearchSourceResponse> getSearchedMovies(String search) async {
    final uri = Uri.https(
        SearchApiConstants.baseurl,
        SearchApiConstants.sourceEndPoint,
        {"api_key": SearchApiConstants.api_key, "query": search});
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      print('Error: ${response.body}');
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
    final json = jsonDecode(response.body);
    return SearchSourceResponse.fromJson(json);
  }
}
