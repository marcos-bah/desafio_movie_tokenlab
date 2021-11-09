class MovieDetailsModel {
  bool adult;
  int budget;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  int revenue;

  MovieDetailsModel({
    required this.adult,
    required this.budget,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.revenue,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json["adult"],
      budget: json["budget"],
      originalLanguage: json["original_language"] ?? '',
      originalTitle: json["original_title"] ?? '',
      overview: json["overview"] ?? '',
      popularity: json["popularity"],
      revenue: json["revenue"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['budget'] = budget;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['revenue'] = revenue;
    return data;
  }
}
