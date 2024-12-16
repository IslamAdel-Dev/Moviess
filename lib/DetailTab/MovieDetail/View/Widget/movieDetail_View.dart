import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/tabs/Details/MovieDetail/View/Widget/movie_detail_tab.dart';
import 'package:movies_app/tabs/Details/MovieDetail/ViewModel/MovieDetailState.dart';
import 'package:movies_app/tabs/Details/MovieDetail/ViewModel/MovieDetailViewModel.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movies_app/tabs/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movies_app/widgets/error_indicator.dart';
import 'package:movies_app/widgets/loading_indicator.dart';

class MoviedetailView extends StatefulWidget {
  static const String routeName = '/MovieDetail';

  @override
  State<MoviedetailView> createState() => _MoviedetailTabState();
}

class _MoviedetailTabState extends State<MoviedetailView> {
  final viewModel = Moviedetailviewmodel();

  @override
  Widget build(BuildContext context) {
    String? MovieId = ModalRoute.of(context)!.settings.arguments.toString();
    print(MovieId);
    viewModel.getMovieDetail(MovieId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<Moviedetailviewmodel, Moviedetailstate>(
        builder: (_, state) {
          if (state is MovieDetailLoading) {
            print(state.toString());
            return LoadingIndicator();
          } else if (state is getMovieDetailError) {
            print(state.toString());
            return ErrorIndicator();
          } else if (state is getMovieDetailSuccess) {
            print(state.toString());
            return MovieDetailTab(state.MovieDetails);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
