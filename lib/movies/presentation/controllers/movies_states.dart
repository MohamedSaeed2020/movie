import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> moviesList;
  final RequestStates requestStates;
  final String errorMessage;

  const MoviesStates(
      {this.moviesList = const [],
      this.requestStates = RequestStates.isLoading,
      this.errorMessage = ''});

  @override
  List<Object> get props => [moviesList, requestStates, errorMessage];
}

class NowPlayingMoviesStates extends MoviesStates {
  const NowPlayingMoviesStates(
      {super.moviesList, super.requestStates, super.errorMessage});
}

class PopularMoviesStates extends MoviesStates {
  const PopularMoviesStates(
      {super.moviesList, super.requestStates, super.errorMessage});
}

class TopRatedMoviesStates extends MoviesStates {
  const TopRatedMoviesStates(
      {super.moviesList, super.requestStates, super.errorMessage});
}
