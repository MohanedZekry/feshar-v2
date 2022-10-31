import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums_state.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source_impl.dart';
import 'package:movieapp/features/movies/data/repository/movies_repository_impl.dart';
import 'package:movieapp/features/movies/domain/repository/movies_repository.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      RemoteMovieDataSource remoteMovieDataSource = RemoteMovieDataSourceImpl();

      MoviesRepository movieRepository =
          MoviesRepositoryImpl(remoteMovieDataSource: remoteMovieDataSource);

      final result =
          await GetNowPlayingMoviesUseCase(moviesRepository: movieRepository)
              .call();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
