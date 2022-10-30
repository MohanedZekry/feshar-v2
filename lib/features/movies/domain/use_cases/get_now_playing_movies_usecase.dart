import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase {

  final MoviesRepository moviesRepository;

  GetNowPlayingMoviesUseCase({required this.moviesRepository});

  Future<List<Movie>> call() async{
    return await moviesRepository.getNowPlayingMovies();
  }

}