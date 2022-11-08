import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/use_case/base_use_case.dart';
import 'package:movieapp/features/movies/domain/entities/movie_details.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, int> {

  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(int params) async {
    return await moviesRepository.getMovieDetails(params);
  }


}