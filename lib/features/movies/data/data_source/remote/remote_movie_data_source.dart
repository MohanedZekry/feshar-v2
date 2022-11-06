import 'package:movieapp/features/movies/data/models/movie_details_model.dart';
import 'package:movieapp/features/movies/data/models/movie_model.dart';

abstract class RemoteMovieDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getTrendingMovies();

  Future<MovieDetailsModel> getMovieDetails(int movieId);

}