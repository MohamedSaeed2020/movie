import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/network/general_failure_model.dart';
import 'package:movie/core/use_case/base_use_case.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class MovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsData> {
  BaseMoviesRepository baseMoviesRepository;

  MovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<GeneralFailureModel, MovieDetails>> call(
      MovieDetailsData parameters) async {
    return await baseMoviesRepository.getMovieDetails(movieId: parameters.id);
  }
}

class MovieDetailsData extends Equatable {
  final int id;

  const MovieDetailsData(this.id);

  @override
  List<Object> get props => [id];
}
