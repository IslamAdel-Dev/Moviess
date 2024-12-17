import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/TopRatedMovies/view/Widget/TopRatedMoviesItem.dart';
import 'package:movies_app/TopRatedMovies/viewModel/TopRatedStates.dart';
import 'package:movies_app/TopRatedMovies/viewModel/TopRatedViewModel.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/View/Widget/SimilarMovieMoviesItem.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/ViewModel/MovieSimilarState.dart';
import 'package:movies_app/tabs/Details/MoviesSimilar/ViewModel/MovieSimilarViewModel.dart';
import 'package:movies_app/widgets/error_indicator.dart';
import 'package:movies_app/widgets/loading_indicator.dart';

class SimilarMoviesList extends StatefulWidget {
  @override
  State<SimilarMoviesList> createState() => _topRatedMoviesListState();
  String movieId;
  SimilarMoviesList(this.movieId);
}

class _topRatedMoviesListState extends State<SimilarMoviesList> {
  final viewModel = MovieSimilarviewmodel();

  @override
  Widget build(BuildContext context) {
    viewModel.getMovieSimilar(widget.movieId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MovieSimilarviewmodel, MovieSimilarstate>(
        builder: (_, state) {
          if (state is MovieSimilarLoading) {
            return LoadingIndicator();
          } else if (state is getMovieSimilarError) {
            return ErrorIndicator();
          } else if (state is getMovieSimilarSuccess) {
            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    Similarmoviesitem(state.MovieSimilars.results![index]),
                itemCount: state.MovieSimilars.results?.length,
              ),
            );
          } else {
            return Text(
              'Failed to get Movie ',
              style: TextStyle(color: AppTheme.white),
            );
          }
        },
      ),
    );
  }
}
