import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums_state.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc({required this.getNowPlayingMoviesUseCase}) : super(const MoviesState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {

      final result =
          await getNowPlayingMoviesUseCase.call();
      print(result);
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }

}