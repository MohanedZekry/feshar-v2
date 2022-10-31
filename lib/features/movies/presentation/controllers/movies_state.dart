import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums_state.dart';
import 'package:movieapp/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {

  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String message;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.loading,
    this.message = ''
  });

  @override
  List<Object?> get props => [nowPlayingMovies, requestState, message];

}
