/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

TopRatedMovies topRatedMoviesFromJson(String str) =>
    TopRatedMovies.fromJson(json.decode(str));

class TopRatedMovies {
  TopRatedMovies({
    required this.page,
    required this.totalPages,
    required this.topRatedMovies,
    required this.totalResults,
  });

  int page;
  int totalPages;
  List<topRatedMovie> topRatedMovies;
  int totalResults;

  factory TopRatedMovies.fromJson(Map<dynamic, dynamic> json) => TopRatedMovies(
        page: json["page"],
        totalPages: json["total_pages"],
        topRatedMovies: List<topRatedMovie>.from(
            json["results"].map((x) => topRatedMovie.fromJson(x))),
        totalResults: json["total_results"],
      );
}

class topRatedMovie {
  topRatedMovie({
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
    required this.video,
    required this.title,
    required this.genreIds,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.id,
    required this.adult,
    required this.voteCount,
  });

  String overview;
  String originalLanguage;
  String originalTitle;
  bool video;
  String title;
  List<int> genreIds;
  String posterPath;
  String backdropPath;
  DateTime releaseDate;
  double popularity;
  double voteAverage;
  int id;
  bool adult;
  int voteCount;

  factory topRatedMovie.fromJson(Map<dynamic, dynamic> json) => topRatedMovie(
        overview: json["overview"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        video: json["video"],
        title: json["title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        popularity: json["popularity"]?.toDouble(),
        voteAverage: json["vote_average"]?.toDouble(),
        id: json["id"],
        adult: json["adult"],
        voteCount: json["vote_count"],
      );
}
