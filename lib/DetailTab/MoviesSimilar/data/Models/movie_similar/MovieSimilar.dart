import 'package:movies_app/tabs/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';

class MovieSimilar {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MovieSimilar({this.page, this.results, this.totalPages, this.totalResults});

  MovieSimilar.fromJson(Map<String, dynamic> json) {
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
