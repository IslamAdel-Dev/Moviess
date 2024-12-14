import 'package:movies/models/response_search/search_source.dart';

class SearchSourceResponse {
  int? page;
  List<SearchSource>? results;
  int? totalPages;
  int? totalResults;

  SearchSourceResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  SearchSourceResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SearchSource>[];
      json['results'].forEach((v) {
        results!.add(new SearchSource.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
