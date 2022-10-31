import 'package:movieapp/features/movies/data/models/movie_model.dart';

abstract class RemoteMovieDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMoves();

  Future<List<MovieModel>> getTopRatedMoves();

}