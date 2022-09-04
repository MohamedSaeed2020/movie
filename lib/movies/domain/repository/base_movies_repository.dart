import 'package:dartz/dartz.dart';
import 'package:movie/core/network/general_failure_model.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';

abstract class BaseMoviesRepository {
  Future<Either<GeneralFailureModel, List<Movie>>> getNowPlayingMovies();

  Future<Either<GeneralFailureModel, List<Movie>>> getPopularMovies();

  Future<Either<GeneralFailureModel, List<Movie>>> getTopRatedMovies();

  Future<Either<GeneralFailureModel, MovieDetails>> getMovieDetails(
      {required int movieId});

  Future<Either<GeneralFailureModel, List<Recommendations>>> getMovieRecommendations(
      {required int movieId});
}
