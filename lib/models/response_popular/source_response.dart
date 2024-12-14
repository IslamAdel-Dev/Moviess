import 'package:movies/models/response_popular/source.dart';

class SourceResponse {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  SourceResponse({this.page, this.results, this.totalPages, this.totalResults});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
