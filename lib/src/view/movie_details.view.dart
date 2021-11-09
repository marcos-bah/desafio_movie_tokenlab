import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';
import 'package:desafio_movie_tokenlab/src/widgets/badge.widget.dart';
import 'package:desafio_movie_tokenlab/src/widgets/star.widget.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.cast,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black26,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.white10,
            child: CachedNetworkImage(
              imageUrl: movie.posterUrl,
              fit: BoxFit.fitHeight,
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Text(
              "Lançado em: ${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: StarWidget(voteAverage: movie.voteAverage / 2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    movie.genres.map((e) => BadgeWidget(title: e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
