import 'package:movie/movies/data/models/geners_model.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.overview,
      required super.genres,
      required super.releaseDate,
      required super.runTime,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      title: json["title"],
      overview: json["overview"],
      genres: List<GenresModel>.from(((json["genres"]) as List)
          .map((genreJson) => GenresModel.fromJson(genreJson))),
      releaseDate: json["release_date"],
      runTime: json["runtime"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
