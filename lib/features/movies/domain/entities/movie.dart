import 'package:equatable/equatable.dart';

class Movie extends Equatable {

  final int id;
  final String backgroundPath;
  final String title;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.backgroundPath,
    required this.title,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate

  });

  @override
  List<Object> get props => [
    id,
    backgroundPath,
    title,
    genreIds,
    overview,
    voteAverage,
    releaseDate
  ];
}