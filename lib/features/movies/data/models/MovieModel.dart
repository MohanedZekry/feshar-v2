import 'package:movieapp/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {

  const MovieModel({
    required super.id,
    required super.backgroundPath,
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
    MovieModel(
        id: json['id'],
        backgroundPath: json['backdrop_path'],
        title: json['title'],
        genreIds: List<int>.from(json['genreIds'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['voteAverage'],
        releaseDate: json['releaseDate']
    );


}