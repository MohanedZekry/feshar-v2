import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {

  final String backDropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;
  final List<Genre> genres;

  const MovieDetails({
    required this.backDropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.genres,
    required this.title,
    required this.voteAverage
  });

  @override
  List<Object?> get props =>
      [
        backDropPath,
        id,
        overview,
        releaseDate,
        runTime,
        title,
        voteAverage
      ];

}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}