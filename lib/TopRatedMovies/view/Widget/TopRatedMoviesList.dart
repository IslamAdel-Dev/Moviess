import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/TopRatedMovies/view/Widget/TopRatedMoviesItem.dart';
import 'package:movies_app/TopRatedMovies/viewModel/TopRatedStates.dart';
import 'package:movies_app/TopRatedMovies/viewModel/TopRatedViewModel.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/widgets/error_indicator.dart';
import 'package:movies_app/widgets/loading_indicator.dart';

class topRatedMoviesList extends StatefulWidget {
  @override
  State<topRatedMoviesList> createState() => _topRatedMoviesListState();
}

class _topRatedMoviesListState extends State<topRatedMoviesList> {
  final viewModel = TopRatedViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getTopRatedMovies();
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<TopRatedViewModel, topRatedStates>(
        builder: (_, state) {
          if (state is getTopRatedMoviesLoading) {
            return LoadingIndicator();
          } else if (state is getTopRatedMoviesError) {
            return ErrorIndicator();
          } else if (state is getTopRatedMoviesSuccess) {
            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    Topratedmoviesitem(state.TopRatedMovie[index]),
                itemCount: state.TopRatedMovie.length,
              ),
            );
          } else {
            return Text(
              'Failed to get ',
              style: TextStyle(color: AppTheme.white),
            );
          }
        },
      ),
    );
  }
}
