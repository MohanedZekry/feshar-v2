import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/use_case/base_use_case.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';
import '../entities/movie.dart';

class GetTrendingMoviesUseCase extends BaseUseCase<List<Movie>, NoParams>{

  final MoviesRepository moviesRepository;

  GetTrendingMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await moviesRepository.getTrendingMovies();
  }

}