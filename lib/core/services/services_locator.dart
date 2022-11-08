import 'package:get_it/get_it.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source_impl.dart';
import 'package:movieapp/features/movies/data/repository/movies_repository_impl.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_top_rated_movies_usecase.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_trending_movies_use_case.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_bloc.dart';
import '../../features/movies/data/data_source/remote/remote_movie_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Date Source
    sl.registerLazySingleton<RemoteMovieDataSource>(
            () => RemoteMovieDataSourceImpl());

    /// Repository
    sl.registerLazySingleton<MoviesRepository>(
            () => MoviesRepositoryImpl(remoteMovieDataSource: sl()));

    /// UseCases
    sl.registerLazySingleton(
            () => GetNowPlayingMoviesUseCase(moviesRepository: sl()));
    sl.registerLazySingleton(
            () => GetTopRatedMoviesUseCase(moviesRepository: sl()));
    sl.registerLazySingleton(
            () => GetPopularMoviesUseCase(moviesRepository: sl()));
    sl.registerLazySingleton(() =>
        GetTrendingMoviesUseCase(moviesRepository: sl()));
    sl.registerLazySingleton(() =>
        GetMovieDetailsUseCase(moviesRepository: sl()));
    /// BloC
    sl.registerFactory(
            () => MoviesBloc(getNowPlayingMoviesUseCase: sl(), getPopularMoviesUseCase: sl(),
            getTopRatedMoviesUseCase: sl(), getTrendingMoviesUseCase: sl()
        ));
  }
}
