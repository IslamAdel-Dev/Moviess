import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/TopRatedMovies/Repository/TopRatedMoviesRepository.dart';
import 'package:movies_app/TopRatedMovies/viewModel/TopRatedStates.dart';

class TopRatedViewModel extends Cubit<topRatedStates> {
  final repository = TopRatedMoviesRepository();

  TopRatedViewModel() : super(TopRatedMoviessinit());

  Future<void> getTopRatedMovies() async {
    emit(getTopRatedMoviesLoading());

    try {
      final topRatedMovies = await repository.getTopRatedMovies();

      emit(getTopRatedMoviesSuccess(topRatedMovies));
    } catch (error) {
      emit(getTopRatedMoviesError(error.toString()));
    }
  }
}
