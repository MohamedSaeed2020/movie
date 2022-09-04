import 'package:dartz/dartz.dart';
import 'package:movie/core/network/general_failure_model.dart';
import 'package:movie/core/use_case/base_use_case.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class NowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  BaseMoviesRepository baseMoviesRepository;

  NowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<GeneralFailureModel, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
