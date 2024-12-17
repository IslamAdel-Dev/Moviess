import 'package:movies_app/tabs/Details/MovieDetail/Repository/movieDetailRepository.dart';
import 'package:movies_app/tabs/Details/MovieDetail/ViewModel/MovieDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/Repository/movieSimilarRepository.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/ViewModel/MovieSimilarState.dart';

class MovieSimilarviewmodel extends Cubit<MovieSimilarstate> {
  final repository = MovieSimilarrepository();

  MovieSimilarviewmodel() : super(MovieSimilarinit());

  Future<void> getMovieSimilar(String MoiveId) async {
    emit(MovieSimilarLoading());
    try {
      final similarmovie = await repository.getMovieSimilar(MoiveId);
      emit(getMovieSimilarSuccess(similarmovie));
    } catch (error) {
      print(error.toString());
      emit(getMovieSimilarError(error.toString()));
    }
  }
}
