import 'package:movieapp/features/movies/data/models/MovieModel.dart';

abstract class RemoteMovieDataSource {

  Future<List<MovieModel>> getNowPlayingMovies();

}