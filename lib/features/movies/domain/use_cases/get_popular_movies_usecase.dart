import 'package:movieapp/features/movies/domain/entities/movie.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUseCase {

  final MoviesRepository moviesRepository;

  GetPopularMoviesUseCase({required this.moviesRepository});

  Future<List<Movie>> call() async{
    return await moviesRepository.getPopularMovies();
  }

}