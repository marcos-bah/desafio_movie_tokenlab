class MovieModel {
  int id;
  double voteAverage;
  String title;
  String posterUrl;
  List genres;
  DateTime releaseDate;

  MovieModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      voteAverage: json['vote_average'],
      title: json['title'],
      posterUrl: json['poster_url'],
      genres: json['genres'],
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['poster_url'] = posterUrl;
    data['genres'] = genres;
    data['release_date'] = releaseDate.toString();
    return data;
  }
}
