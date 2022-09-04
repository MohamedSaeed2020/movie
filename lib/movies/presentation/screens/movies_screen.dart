import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/app_strings.dart';
import 'package:movie/movies/presentation/components/now_playing_movie_component.dart';
import 'package:movie/movies/presentation/components/popular_movie_component.dart';
import 'package:movie/movies/presentation/components/top_rated_movie_component.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_events.dart';
import 'package:movie/movies/presentation/widgets/header_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('MoviesScreen Build');
    return BlocProvider(
      create: (context) => locator<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              NowPlayingMovieComponent(),
              HeaderWidget(
                headerTitle: AppStrings.popular,
              ),
              PopularMovieComponent(),
              HeaderWidget(
                headerTitle: AppStrings.topRated,
              ),
              TopRatedMovieComponent(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
