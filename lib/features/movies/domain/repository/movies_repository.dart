import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/features/movies/domain/entities/movie_details.dart';
import 'package:movieapp/features/movies/domain/entities/recommendation.dart';
import '../entities/movie.dart';

abstract class MoviesRepository {

  Future<Either<Failure ,List<Movie>>>  getNowPlayingMovies();

  Future<Either<Failure ,List<Movie>>>  getPopularMovies();

  Future<Either<Failure ,List<Movie>>>  getTopRatedMovies();

  Future<Either<Failure, List<Movie>>> getTrendingMovies();

  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(int movieId);

  Future<Either<Failure , MovieDetails>>  getMovieDetails(int movieId);

}