import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source.dart';
import 'package:movieapp/features/movies/domain/entities/movie.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final RemoteMovieDataSource remoteMovieDataSource;

  MoviesRepositoryImpl({required this.remoteMovieDataSource});

  @override
  Future<Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    final result = await remoteMovieDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>>  getPopularMovies() async{
    final result = await remoteMovieDataSource.getPopularMoves();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>>  getTopRatedMovies() async{
    final result = await remoteMovieDataSource.getTopRatedMoves();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

}