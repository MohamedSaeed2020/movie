import 'package:dartz/dartz.dart';
import 'package:movie/core/network/exception_mapper.dart';
import 'package:movie/core/network/general_failure_model.dart';
import 'package:movie/movies/data/data_source/remote_movie_data_source.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MoviesRepository(this.baseRemoteMovieDataSource);

  @override
  Future<Either<GeneralFailureModel, List<Movie>>> getNowPlayingMovies() async {

    try {
      final result = await baseRemoteMovieDataSource.getNowPlayingMovies();
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<GeneralFailureModel, List<Movie>>> getTopRatedMovies() async {

    try {
      final result = await baseRemoteMovieDataSource.getTopRatedMovies();
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<GeneralFailureModel, List<Movie>>> getPopularMovies() async {

    try {
      final result = await baseRemoteMovieDataSource.getPopularMovies();
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<GeneralFailureModel, MovieDetails>> getMovieDetails(
      {required int movieId}) async {


    try {
      final result =
      await baseRemoteMovieDataSource.getMovieDetails(movieId: movieId);
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<GeneralFailureModel, List<Recommendations>>> getMovieRecommendations({required int movieId})async {


    try {
      final result =
      await baseRemoteMovieDataSource.getMovieRecommendations(movieId: movieId);
      return Right(result);
    } on RemoteServerException catch (exception) {
      return Left(RemoteServerFailure(exception.errorModel.statusMessage));
    }
  }
}
