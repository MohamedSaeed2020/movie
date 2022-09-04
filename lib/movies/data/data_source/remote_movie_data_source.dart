
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/api_end_points.dart';
import 'package:movie/core/network/error_model.dart';
import 'package:movie/core/network/exception_mapper.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/data/models/recommendations_model.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails({required int movieId});

  Future<List<Recommendations>> getMovieRecommendations({required int movieId});
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final Response response = await Dio().get(
      '${ApiConstants.baseUrl}${ApiEndPoints.nowPlayingMoviesEndPoint}',
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movieModel) => MovieModel.fromJson(movieModel),
        ),
      );

      //OR USE THE FOLLOWING
      // ignore: dead_code
      return response.data['results']
          .map((movieModel) => MovieModel.fromJson(movieModel))
          .toList();
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final Response response = await Dio().get(
      '${ApiConstants.baseUrl}${ApiEndPoints.topRatedMoviesEndPoint}',
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movieModel) => MovieModel.fromJson(movieModel),
        ),
      );
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final Response response = await Dio().get(
      '${ApiConstants.baseUrl}${ApiEndPoints.popularMoviesEndPoint}',
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (movieModel) => MovieModel.fromJson(movieModel),
        ),
      );
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    final Response response = await Dio().get(
      '${ApiConstants.baseUrl}${ApiEndPoints.movieDetailsEndPoint}$movieId',
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendations>> getMovieRecommendations(
      {required int movieId}) async {
    final Response response = await Dio().get(
      '${ApiConstants.baseUrl}${ApiEndPoints.movieDetailsEndPoint}$movieId/${ApiEndPoints.movieRecommendationsEndPoint}',
      queryParameters: {'api_key': ApiConstants.apiKey},
    );
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
        (response.data['results'] as List).map(
          (recommendationsJson) =>
              RecommendationsModel.fromJson(recommendationsJson),
        ),
      );
    } else {
      throw RemoteServerException(
          errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
