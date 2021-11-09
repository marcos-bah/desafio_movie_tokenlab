# Desafio Movie TokenLab

Um projeto feito em flutter para consumir uma API REST como parte do desafio proposto pela empresa TokenLab.

## Suporte

[x] Android [(download here)](download.com)  
[x] Linux  
[x] Web [(see demo)](download.com)

## Features

[x] Movie Service  
[x] Movie Model  
[x] Movie Controller  
[x] Movie View  
[x] Movie Details View  
[x] Named Routes  
[x] Shared Preferences  
[x] Image Cache
[x] Efeito Shimmer

## Como funciona?

O projeto possui duas telas principais:

- HomeView
- MovieDetailsView

As telas permitem que o usuário possa navegar pela aplicação e consiga visualizar os dados fornecidos pela API.

## API

Veja abaixo um exemplo do retorno da API:

```
[
    {
      "id": 19404,
      "vote_average": 9.3,
      "title": "Dilwale Dulhania Le Jayenge",
      "poster_url": "https://image.tmdb.org/t/p/w200/uC6TTUhPpQCmgldGyYveKRAu8JN.jpg",
      "genres": [
        "Comedy",
        "Drama",
        "Romance"
      ],
      "release_date": "1995-10-20"
    }
]
```

Para manipular esses dados de form afácil na aplicação, foi criado o seguinte model:

```
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

  ...
}
```

Agora para obter os dados da internet, usamos o plugin http para as requisições e criamos o service a seguir:

```
...

class URL {
    static const String base =
        "https://desafio-mobile######";
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
}

...
```

## License

MIT

**Free Software, Hell Yeah!**

## Author

| [<img src="https://avatars3.githubusercontent.com/u/49887610?s=96&v=4"><br><sub>@marcos-bah</sub>](https://github.com/marcos-bah) |
| :-------------------------------------------------------------------------------------------------------------------------------: |
