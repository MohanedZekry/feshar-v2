import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source.dart';
import 'package:movieapp/features/movies/domain/entities/movie.dart';
import 'package:movieapp/features/movies/domain/entities/movie_details.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final RemoteMovieDataSource remoteMovieDataSource;

  MoviesRepositoryImpl({required this.remoteMovieDataSource});

  @override
  Future<Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    try{
      final result = await remoteMovieDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>>  getPopularMovies() async{
    try{
      final result = await remoteMovieDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try{
      final result = await remoteMovieDataSource.getTrendingMovies();
      return Right(result);
    }  on ServerException catch(failure) {

      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>>  getTopRatedMovies() async{
    try{
      final result = await remoteMovieDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    try {
      final result =  await remoteMovieDataSource.getMovieDetails(movieId);
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }



}