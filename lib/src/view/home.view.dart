import 'package:desafio_movie_tokenlab/src/app/app.colors.dart';
import 'package:desafio_movie_tokenlab/src/controller/movie.controller.dart';
import 'package:desafio_movie_tokenlab/src/model/movie.model.dart';

import 'package:desafio_movie_tokenlab/src/widgets/custom_general.widget.dart';
import 'package:desafio_movie_tokenlab/src/widgets/movies_scrool.widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MovieController controller = MovieController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryDark,
        title: Image.asset(
          "assets/images/logo.png",
          height: 60,
        ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
        ),
        child: RefreshIndicator(
          onRefresh: () => controller.fetchMovies(),
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: FutureBuilder<List<MovieModel>>(
            future: controller.fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                if (snapshot.hasData) {
                  List<MovieModel> movies = snapshot.data!;
                  return MoviesScroolWidget(movies: movies);
                } else {
                  return const Center(
                    child: Text('Sem dados'),
                  );
                }
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomGeneralWidget.rectangular(
                          height: 20,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              CustomGeneralWidget.rectangular(
                                height: 230,
                                width: 160,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomGeneralWidget.rectangular(
                                height: 230,
                                width: 160,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomGeneralWidget.rectangular(
                                height: 230,
                                width: 160,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
