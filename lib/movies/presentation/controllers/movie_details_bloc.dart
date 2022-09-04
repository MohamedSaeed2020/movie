import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendations.dart';
import 'package:movie/movies/domain/use_cases/movie_details_use_case.dart';
import 'package:movie/movies/domain/use_cases/movie_recommendations_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.movieDetailsUseCase, this.movieRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  MovieDetailsUseCase movieDetailsUseCase;
  MovieRecommendationsUseCase movieRecommendationsUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await movieDetailsUseCase(MovieDetailsData(event.movieId));
    result.fold(
      (failure) {
        emit(state.copyWith(
          movieDetailsRequestStates: RequestStates.isError,
          movieDetailsErrorMessage: failure.errorMessage,
        ));
        log('failure: ${failure.errorMessage}');
      },
      (movieDetails) {
        emit(state.copyWith(
          movieDetailsRequestStates: RequestStates.isLoaded,
          movieDetails: movieDetails,
        ));
        log('movieDetails: ${movieDetails.id}');
      },
    );
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await movieRecommendationsUseCase(
        MovieRecommendationData(event.movieId));
    result.fold(
      (failure) {
        emit(state.copyWith(
          recommendationsRequestStates: RequestStates.isError,
          recommendationsErrorMessage: failure.errorMessage,
        ));
        log('failure: ${failure.errorMessage}');
      },
      (movieRecommendationsList) {
        emit(state.copyWith(
          recommendationsRequestStates: RequestStates.isLoaded,
          recommendations: movieRecommendationsList,
        ));
        if(movieRecommendationsList.isNotEmpty){
          log('movieRecommendationsList: ${movieRecommendationsList[0].backdropPath}');
        }else{
          log('movieRecommendationsList: Empty');
        }
      },
    );
  }
}
