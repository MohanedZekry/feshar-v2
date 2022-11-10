import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/use_case/base_use_case.dart';
import 'package:movieapp/features/movies/domain/entities/recommendation.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<Recommendation>, int>{

  final MoviesRepository moviesRepository;

  GetRecommendationMoviesUseCase({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(int params) async {
    return await moviesRepository.getRecommendationMovies(params);
  }

}