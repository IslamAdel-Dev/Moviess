import 'package:movies/models/similar/similar_source.dart';

class SimilarResponse {
  int? page;
  List<SimilarSource>? results;
  int? totalPages;
  int? totalResults;

  SimilarResponse({this.page, this.results, this.totalPages, this.totalResults});

  SimilarResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SimilarSource>[];
      json['results'].forEach((v) {
        results!.add(new SimilarSource.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  
}