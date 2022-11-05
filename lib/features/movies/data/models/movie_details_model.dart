import 'package:movieapp/features/movies/data/models/genre_model.dart';
import 'package:movieapp/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{

  const MovieDetailsModel({
    required super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.genres,
    required super.title,
    required super.voteAverage
  });

  factory MovieDetailsModel.fromJson(Map<String,dynamic> json){
    return MovieDetailsModel(
        backDropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        genres: List.from(json['genres'].map((e) => GenreModel.fromJson(e))),
        title: json['title'],
        voteAverage: json['vote_average'].toDouble()
    );
  }

}