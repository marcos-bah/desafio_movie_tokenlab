import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';
import 'package:flutter/material.dart';

class MoviesScroolWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const MoviesScroolWidget({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget movieCard(MovieModel movie) {
      return Padding(
        padding: const EdgeInsets.only(right: 10, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/movie-details', arguments: {'movie': movie});
          },
          child: Container(
            height: 230,
            width: 160,
            color: Colors.white10,
            child: CachedNetworkImage(
              imageUrl: movie.posterUrl,
              fit: BoxFit.fill,
              errorWidget: (context, error, stackTrace) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.white10,
                          size: 36,
                        ),
                        Text(
                          "${movie.title}\nImagem não encontrada",
                          style: const TextStyle(
                            color: Colors.white10,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                );
              },
              progressIndicatorBuilder: (context, child, loadingProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      );
    }

    Widget horizontalList(List<MovieModel> list, String genre) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            genre,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: list.map((e) => movieCard(e)).toList(),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      );
    }

    List genres = [];
    for (var item in movies) {
      genres.addAll(item.genres);
    }

    genres = genres.toSet().toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: genres
            .map(
              (e) => horizontalList(
                  movies
                      .where((element) => element.genres.contains(e))
                      .toList(),
                  e),
            )
            .toList(),
      ),
    );
  }
}
