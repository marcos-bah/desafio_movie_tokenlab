import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';
import 'package:desafio_movie_tokenlab/src/service/movie.service.dart';

class MovieController {
  final MovieService _service = MovieService();
  Future<List<MovieModel>> fetchMovies() async => await _service.getMovies();
  Future<List<MovieModel>> fetchMoviesCached() async =>
      await _service.getMoviesCached();
}
