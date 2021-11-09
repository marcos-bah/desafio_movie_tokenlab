import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_movie_tokenlab/src/app/app.colors.dart';
import 'package:desafio_movie_tokenlab/src/controller/movie.controller.dart';
import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';
import 'package:desafio_movie_tokenlab/src/model/movie_details.model.dart';
import 'package:desafio_movie_tokenlab/src/widgets/badge.widget.dart';
import 'package:desafio_movie_tokenlab/src/widgets/custom_general.widget.dart';
import 'package:desafio_movie_tokenlab/src/widgets/star.widget.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  MovieController controller = MovieController();
  MovieDetailsModel? movieDetailsModel;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (movieDetailsModel == null) {
      controller.fetchMoviesDetails(widget.movie.id.toString()).then(
        (value) {
          setState(() {
            movieDetailsModel = value;
            print(movieDetailsModel);
          });
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
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
        backgroundColor: AppColors.secondary,
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
              imageUrl: widget.movie.posterUrl,
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
                          "${widget.movie.title}\nImagem não encontrada",
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
              widget.movie.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: Text(
              "Lançado em: ${widget.movie.releaseDate.day}/${widget.movie.releaseDate.month}/${widget.movie.releaseDate.year}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: StarWidget(voteAverage: widget.movie.voteAverage / 2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.movie.genres
                    .map((e) => BadgeWidget(title: e))
                    .toList(),
              ),
            ),
          ),
          movieDetailsModel == null
              ? const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    top: 10,
                    right: 16,
                  ),
                  child: CustomGeneralWidget.rectangular(height: 80),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 10),
                  child: Text(
                    movieDetailsModel!.overview,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
