import 'package:desafio_movie_tokenlab/src/view/home.view.dart';
import 'package:desafio_movie_tokenlab/src/view/movie_details.view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Movie TokenLab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black38,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/home': (context) => const HomeView(),
        '/movie-details': (context) {
          Map arg = ModalRoute.of(context)!.settings.arguments as Map;
          return MovieDetailsView(movie: arg['movie']);
        }
      },
    );
  }
}
