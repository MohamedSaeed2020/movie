import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/use_case/base_use_case.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/use_cases/now_playing_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/popular_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/top_rated_movies_use_case.dart';
import 'package:movie/movies/presentation/controllers/movies_events.dart';
import 'package:movie/movies/presentation/controllers/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final NowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final PopularMoviesUseCase popularMoviesUseCase;
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  MoviesBloc(this.nowPlayingMoviesUseCase, this.popularMoviesUseCase,
      this.topRatedMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    /* BaseRemoteMovieDataSource baseRemoteMovieDataSource =
          RemoteMovieDataSource();
      BaseMoviesRepository baseMoviesRepository =
          MoviesRepository(baseRemoteMovieDataSource);
      final result = await NowPlayingMoviesUseCase(baseMoviesRepository)
          .executeNowPlayingMovies();*/

    final result = await nowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          NowPlayingMoviesStates(
            requestStates: RequestStates.isError,
            errorMessage: failure.errorMessage,
          ),
        );
        log('failure: ${failure.errorMessage}');
      },
      (nowPlayingMoviesList) {
        emit(
          NowPlayingMoviesStates(
            requestStates: RequestStates.isLoaded,
            moviesList: nowPlayingMoviesList,
          ),
        );
        //log('nowPlayingMoviesList: ${nowPlayingMoviesList[0].overview}');
      },
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await popularMoviesUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          PopularMoviesStates(
            requestStates: RequestStates.isError,
            errorMessage: failure.errorMessage,
          ),
        );
        log('failure: ${failure.errorMessage}');
      },
      (popularMoviesList) {
        emit(
          PopularMoviesStates(
            requestStates: RequestStates.isLoaded,
            moviesList: popularMoviesList,
          ),
        );
        //log('popularMoviesList: ${popularMoviesList[0].overview}');
      },
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await topRatedMoviesUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          TopRatedMoviesStates(
            requestStates: RequestStates.isError,
            errorMessage: failure.errorMessage,
          ),
        );
        log('failure: ${failure.errorMessage}');
      },
      (topRatedMoviesList) {
        emit(
          TopRatedMoviesStates(
            requestStates: RequestStates.isLoaded,
            moviesList: topRatedMoviesList,
          ),
        );
        //log('topRatedMoviesList: ${topRatedMoviesList[0].overview}');
      },
    );
  }
}
