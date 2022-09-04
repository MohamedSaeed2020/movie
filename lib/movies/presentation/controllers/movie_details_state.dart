part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestStates movieDetailsRequestStates;
  final String movieDetailsErrorMessage;
  final MovieDetails? movieDetails;
  final RequestStates recommendationsRequestStates;
  final String recommendationsErrorMessage;
  final List<Recommendations> recommendations;

  const MovieDetailsState({
    this.movieDetailsRequestStates = RequestStates.isLoading,
    this.movieDetailsErrorMessage = '',
    this.movieDetails,
    this.recommendationsRequestStates = RequestStates.isLoading,
    this.recommendationsErrorMessage = '',
    this.recommendations = const [],
  });

  MovieDetailsState copyWith({
    final RequestStates? movieDetailsRequestStates,
    final String? movieDetailsErrorMessage,
    final MovieDetails? movieDetails,
    final RequestStates? recommendationsRequestStates,
    final String? recommendationsErrorMessage,
    final List<Recommendations>? recommendations,
  }) {
    return MovieDetailsState(
      movieDetailsRequestStates:
          movieDetailsRequestStates ?? this.movieDetailsRequestStates,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      recommendationsRequestStates:
          recommendationsRequestStates ?? this.recommendationsRequestStates,
      recommendationsErrorMessage:
          recommendationsErrorMessage ?? this.recommendationsErrorMessage,
      recommendations: recommendations ?? this.recommendations,
    );
  }

  @override
  List<Object?> get props => [
        movieDetailsRequestStates,
        movieDetailsErrorMessage,
        movieDetails,
        recommendationsRequestStates,
        recommendationsErrorMessage,
        recommendations,
      ];
}
