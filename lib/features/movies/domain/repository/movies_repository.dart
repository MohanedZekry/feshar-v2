import '../entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();

}