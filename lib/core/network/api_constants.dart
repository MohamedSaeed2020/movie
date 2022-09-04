class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "9a291aff04fc52f929cdea684894d324";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String imagePath) => '$imageBaseUrl$imagePath';
}
