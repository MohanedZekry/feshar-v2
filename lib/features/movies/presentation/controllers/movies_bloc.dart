import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums_state.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_event.dart';
import '../../domain/use_cases/get_popular_movies_usecase.dart';
import '../../domain/use_cases/get_top_rated_movies_usecase.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc({required this.getNowPlayingMoviesUseCase,
    required this.getTopRatedMoviesUseCase, required this.getPopularMoviesUseCase}) : super(const MoviesState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovies);
    on<GetPopularMovieEvent>(_getPopularMovies);
    on<GetTopRatedMovieEvent>(_getTopRatedMovies);

  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMovieEvent event
      , Emitter<MoviesState> emit) async {
    final result =
    await getNowPlayingMoviesUseCase.call();

    result.fold(
            (l) => emit(
            state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message)),
            (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)
        ));
  }

  FutureOr<void> _getPopularMovies(GetPopularMovieEvent event, Emitter<MoviesState> emit) async {
    final result
    = await getPopularMoviesUseCase.call();

    result.fold(
            (l) => emit(
            state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)
        ));
  }

  Future<FutureOr<void>> _getTopRatedMovies(GetTopRatedMovieEvent event, Emitter<MoviesState> emit) async {
    final result
    = await getTopRatedMoviesUseCase.call();

    result.fold(
            (l) => emit(
            state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)
        ));

  }
}