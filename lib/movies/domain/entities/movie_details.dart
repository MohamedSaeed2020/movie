import 'package:equatable/equatable.dart';
import 'package:movie/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final List<Genres> genres;
  final String releaseDate;
  final int runTime;
  final double voteAverage;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.genres,
    required this.releaseDate,
    required this.runTime,
    required this.voteAverage,
  });
  @override
  List<Object> get props =>
      [
        id,
        backdropPath,
        title,
        overview,
        genres,
        releaseDate,
        runTime,
        voteAverage,
      ];
}
