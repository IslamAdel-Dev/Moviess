import 'package:movies_app/tabs/Details/MovieDetail/Repository/movieDetailRepository.dart';
import 'package:movies_app/tabs/Details/MovieDetail/ViewModel/MovieDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Moviedetailviewmodel extends Cubit<Moviedetailstate> {
  final repository = Moviedetailrepository();

  Moviedetailviewmodel() : super(MovieDetailinit());

  Future<void> getMovieDetail(String MoiveId) async {
    emit(MovieDetailLoading());
    try {
      final DetailMovie = await repository.getMovieDetail(MoiveId);
      emit(getMovieDetailSuccess(DetailMovie));
    } catch (error) {
      print(error.toString());
      emit(getMovieDetailError(error.toString()));
    }
  }
}
