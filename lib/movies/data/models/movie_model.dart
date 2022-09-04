import 'package:movie/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      backdropPath: json["backdrop_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      genreIds: List<int>.from(((json["genre_ids"]) as List).map((e) => e)),
    );

  }
}
