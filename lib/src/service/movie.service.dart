import 'dart:convert';

import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';
import 'package:desafio_movie_tokenlab/src/model/movie_details.model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class URL {
  static const String base =
      "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies";
}

class MovieService {
  Future<List<MovieModel>> getMovies() async {
    final response = await http
        .get(Uri.parse(URL.base), headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final List movies = jsonDecode(response.body);
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  Future<MovieDetailsModel> getMoviesDetailsById(String id) async {
    final response = await http.get(Uri.parse(URL.base + '/' + id),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailsModel.fromJson(movie);
    } else {
      throw Exception("Failed to load movies details");
    }
  }

  Future<List<MovieModel>> getMoviesCached() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List movies = jsonDecode(prefs.getStringList('movies').toString());
    if (movies.isEmpty) {
      return await getMovies().then((value) => value);
    }
    return movies.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  Future<bool> setMoviesCached(List<MovieModel> movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setStringList(
          'movies', movies.map((e) => e.toJson().toString()).toList());
      return true;
    } catch (e) {
      return false;
    }
  }
}
