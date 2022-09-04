import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/network/general_failure_model.dart';
import 'package:movie/core/use_case/base_use_case.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class MovieRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, MovieRecommendationData> {
  BaseMoviesRepository baseMoviesRepository;

  MovieRecommendationsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<GeneralFailureModel, List<Recommendations>>> call(
      MovieRecommendationData parameters) async {
    return await baseMoviesRepository.getMovieRecommendations(
        movieId: parameters.id);
  }
}

class MovieRecommendationData extends Equatable {
  final int id;

  const MovieRecommendationData(this.id);

  @override
  List<Object> get props => [id];
}
