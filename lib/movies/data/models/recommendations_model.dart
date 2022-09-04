import 'package:movie/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
    required super.id,
     super.backdropPath,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      id: json["id"],
      backdropPath: json["backdrop_path"]??'/jauI01vUIkPA0xVsamGj0Gs1nNL.jpg',
    );
  }
}
