import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/data_source/remote_movie_data_source.dart';
import 'package:movie/movies/data/repository/movies_repository.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';
import 'package:movie/movies/domain/use_cases/movie_details_use_case.dart';
import 'package:movie/movies/domain/use_cases/movie_recommendations_use_case.dart';
import 'package:movie/movies/domain/use_cases/now_playing_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/popular_movies_use_case.dart';
import 'package:movie/movies/domain/use_cases/top_rated_movies_use_case.dart';
import 'package:movie/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc.dart';

final locator = GetIt.instance; //OR": final locator=GetIt.I;

//Use can use locator() instead of locator.call().
class ServicesLocator {
  static void init() {
    ///Blocs
    locator.registerFactory(() =>
        MoviesBloc(locator(), locator(), locator())); //It is lazy by default.
    //OR
    //locator.registerFactory(() => MoviesBloc(NowPlayingMoviesUseCase(MoviesRepository(RemoteMovieDataSource()))));
    locator.registerFactory(() => MovieDetailsBloc(locator(),locator()));
    ///Data Sources Injection
    locator.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());

    ///Repository Injection
    locator.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(locator()));

    ///Use Cases Injection
    locator.registerLazySingleton(() => NowPlayingMoviesUseCase(locator()));
    locator.registerLazySingleton(() => PopularMoviesUseCase(locator()));
    locator.registerLazySingleton(() => TopRatedMoviesUseCase(locator()));
    locator.registerLazySingleton(() => MovieDetailsUseCase(locator()));
    locator.registerLazySingleton(() => MovieRecommendationsUseCase(locator()));
  }
}
